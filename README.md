# Skydive Inka Perú - Landing Page

Sitio web de landing page para **Skydive Inka Perú (SKIP)**, empresa de paracaidismo deportivo en Pisco, Perú.

## Stack

- **Framework:** Astro 6
- **Estilos:** CSS global
- **Componentes:** Astro (parcialmente interactivo con JavaScript)

## Estructura del proyecto

```
/
├── public/
│   ├── images/          # Imágenes del sitio
│   ├── video/           # Videos (hero)
│   ├── favicon.ico
│   └── favicon.svg
├── src/
│   ├── components/
│   │   ├── sections/    # Secciones principales
│   │   ├── interactive/ # Componentes interactivos
│   │   └── ui/          # Componentes base (Button, Card, Input, etc.)
│   ├── layouts/
│   │   └── BaseLayout.astro
│   ├── pages/
│   │   ├── index.astro          # Página principal
│   │   └── salto-tandem.astro   # Página de salto tándem
│   └── styles/
│       └── global.css
├── astro.config.mjs
├── package.json
└── tsconfig.json
```

## Comandos

| Comando | Descripción |
|---------|-------------|
| `npm install` | Instalar dependencias |
| `npm run dev` | Servidor local en `localhost:4321` |
| `npm run build` | Build de producción en `./dist/` |
| `npm run preview` | Previsualizar build localmente |

## Imágenes y medios

Las imágenes estáticas (logos, fotos, videos) están en `public/images/` y `public/video/`.
