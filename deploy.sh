#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ERROR_LOG="$PROJECT_DIR/error.log"
LOCKFILE="$PROJECT_DIR/package-lock.json"
NODE_MODULES="$PROJECT_DIR/node_modules"
PORT=4321
MIN_NODE_VERSION="22.12.0"
NPM_REGISTRY="https://registry.npmjs.org/"
NPM_MIRROR="https://registry.npmmirror.com/"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

log() {
    echo "[$TIMESTAMP] $*"
}

error_exit() {
    local msg="$*"
    echo "[$TIMESTAMP] ERROR: $msg" >> "$ERROR_LOG"
    echo "ERROR: $msg"
    exit 1
}

cleanup() {
    if [ -n "${ASTRO_PID:-}" ] && kill -0 "$ASTRO_PID" 2>/dev/null; then
        log "Deteniendo servidor (PID $ASTRO_PID)..."
        kill "$ASTRO_PID" 2>/dev/null || true
        wait "$ASTRO_PID" 2>/dev/null || true
    fi
}

check_node_version() {
    local current major_current major_min
    current=$(node --version 2>/dev/null | sed 's/^v//' || true)
    [ -n "$current" ] || error_exit "Node.js no está instalado. Instálalo desde https://nodejs.org/"

    major_current=$(echo "$current" | cut -d. -f1)
    major_min=$(echo "$MIN_NODE_VERSION" | cut -d. -f1)

    if [ "$major_current" -lt "$major_min" ] 2>/dev/null; then
        error_exit "Node.js $current no es suficiente. Requerido >= $MIN_NODE_VERSION"
    fi
    log "Node.js $current OK"
}

check_npm() {
    command -v npm >/dev/null 2>&1 || error_exit "npm no está instalado"
    log "npm $(npm --version) OK"
}

check_directory() {
    [ -d "$PROJECT_DIR" ] || error_exit "Directorio del proyecto no encontrado: $PROJECT_DIR"
    [ -f "$PROJECT_DIR/package.json" ] || error_exit "package.json no encontrado en $PROJECT_DIR"
    [ -w "$PROJECT_DIR" ] || error_exit "Sin permisos de escritura en $PROJECT_DIR"
    log "Directorio OK: $PROJECT_DIR"
}

check_port() {
    local pid
    pid=$(lsof -ti :"$PORT" 2>/dev/null || true)
    if [ -n "$pid" ]; then
        log "Puerto $PORT ocupado por PID $pid. Cerrando..."
        kill "$pid" 2>/dev/null || true
        sleep 1
        pid=$(lsof -ti :"$PORT" 2>/dev/null || true)
        [ -z "$pid" ] || error_exit "No se pudo liberar el puerto $PORT"
        log "Puerto $PORT liberado"
    fi
}

check_previous_astro() {
    local pid
    pid=$(pgrep -f "astro dev" 2>/dev/null || true)
    if [ -n "$pid" ]; then
        log "Proceso astro previo detectado (PID $pid). Terminando..."
        kill "$pid" 2>/dev/null || true
        sleep 1
    fi
}

npm_install_with_fallback() {
    local install_cmd=("npm")
    local registry="$NPM_REGISTRY"

    if [ -f "$LOCKFILE" ]; then
        install_cmd+=("ci")
        log "Lockfile detectado. Usando npm ci..."
    else
        install_cmd+=("install")
        log "Sin lockfile. Usando npm install..."
    fi

    if ! "${install_cmd[@]}" --registry="$registry" 2>/dev/null; then
        log "Registry principal falló. Intentando mirror..."

        install_cmd+=("--registry=$NPM_MIRROR")
        if ! "${install_cmd[@]}" 2>/dev/null; then
            error_exit "No se pudieron instalar dependencias (intentado npmjs.org y npmmirror.com)"
        fi
    fi
    log "Dependencias instaladas correctamente"
}

ensure_dependencies() {
    if [ -d "$NODE_MODULES" ] && [ -f "$NODE_MODULES/astro/package.json" ]; then
        log "Dependencias ya instaladas. Saltando..."
        return
    fi

    log "Instalando dependencias..."
    npm_install_with_fallback
}

deploy_dev() {
    log "Iniciando servidor de desarrollo en puerto $PORT..."
    cd "$PROJECT_DIR"
    npm run dev -- --port "$PORT" &
    ASTRO_PID=$!

    sleep 4

    if ! kill -0 "$ASTRO_PID" 2>/dev/null; then
        error_exit "El servidor falló al iniciar. Revisa $ERROR_LOG"
    fi

    if command -v curl >/dev/null 2>&1; then
        sleep 2
        if curl -sf "http://localhost:$PORT" >/dev/null 2>&1; then
            log "Servidor respondiendo en http://localhost:$PORT"
        else
            log "ADVERTENCIA: No se pudo verificar http://localhost:$PORT (el server puede tardar más)"
        fi
    fi

    log "Servidor desplegado (PID $ASTRO_PID). Ctrl+C para detener."
    wait "$ASTRO_PID"
}

main() {
    trap cleanup EXIT INT TERM
    trap 'error_exit "Error inesperado en línea $LINENO"' ERR

    echo "=== Skydive Landing — Deploy Dev ==="
    log "Iniciando despliegue..."

    check_directory
    check_node_version
    check_npm
    check_port
    check_previous_astro
    ensure_dependencies
    deploy_dev
}

main
