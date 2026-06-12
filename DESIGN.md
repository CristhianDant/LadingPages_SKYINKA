# Skydive Inka Perú - Design System Specification (Unificado)

## 1. Visión General

Estética inmersiva de alto impacto con minimalismo brutalista. Fondos oscuros realzan fotografías de acción, acentos azul-celeste transmiten confianza, seguridad y emoción deportiva. Tipografía condensada bold proyecta adrenalina y exclusividad premium.

## 2. Paleta de Colores

### Colores Principales (Cliente)

| Nombre Lógico | Valor HEX | Uso Asignado |
|---------------|-----------|--------------|
| Primary Blue | #4D7CEA | Botones CTA, acentos, títulos héroe |
| Primary Dark | #0059CB | Estados hover interactivos, énfasis fuerte |
| Primary Light | #7AD7FF | Elementos decorativos, acentos claros |

### Fondos y Superficies

| Nombre Lógico | Valor HEX | Uso Asignado |
|---------------|-----------|--------------|
| Background Dark | #1B1B19 | Navbar, footer, secciones oscuras |
| Background Neutral | #232424 | Footer específico |
| Celeste BG | #F1F4F9 | Testimonios, fondos de secciones alternas |
| White | #FFFFFF | Fondos principales |

### Textos

| Nombre Lógico | Valor HEX | Uso Asignado |
|---------------|-----------|--------------|
| Text Primary | #FFFFFF | Textos sobre fondos oscuros |
| Text Secondary | #B1B3B3 | Navegación, textos soporte |
| Text Dark | #000000 | Textos sobre fondos claros |
| Gray Dark | #333333 | Textos secundarios |
| Gray Medium | #666666 | Textos de soporte |
| Gray Text | #4B4B4B | Textos cuerpo |

### Bordes y Acentos

| Nombre Lógico | Valor HEX | Uso Asignado |
|---------------|-----------|--------------|
| Border Neutral | #E0E1E1 | Separadores secundarios |
| Gray Light | #EBEBEB | Bordes, separadores |
| Accent Gold | #FFD100 | Elementos decorativos |
| Pink Accent | #CC3366 | Acentos especiales, hover links |
| WhatsApp Green | #25D366 | Botón WhatsApp |

## 3. Tipografía (Objetivo)

| Familia | Pesos | Aplicación |
|---------|-------|------------|
| Bemartin 1 / Impact | Regular 400 | Títulos H1-H3, headlines hero |
| Arial | Regular 400, Medium 500 | Body, párrafos, navegación |

**Jerarquía:**
- H1 Hero: 59px uppercase (line-height 1:1), color Primary Blue
- H2: 59px
- H3: 36px
- Body: 14px
- Nav: 14.24px medium uppercase (letter-spacing 0.25px)

## 4. Espaciado y Efectos (Objetivo)

- **Border-radius:** 0px (esquinas cuadradas brutalistas)
- **Box-shadow:** No se utilizan
- **Padding secciones:** 64px estándar, 122px hero (compensa navbar), 144px footer
- **Contenedores:** Max-width 1248px, padding horizontal 20px
- **Gap grids:** 32px entre tarjetas de servicio
- **Transiciones:** `transition: all` suave en interactivos
- **Fondos alternos:** Secciones con Celeste BG (#F1F4F9) para ritmo visual

## 5. Anatomía de Componentes (Objetivo)

### Header
- Fixed, fondo #1B1B19 opaco, 84px alto, z-index 4
- Logo izquierda (LogoSkyDive.png), navegación + acciones derecha
- Se mantiene fijo al scroll con animación sutil
- Barra superior opcional con teléfono y email

### Menú Overlay
- Pantalla completa, fondo #1B1B19
- Enlaces uppercase 36px, redes sociales en parte inferior

### Botón CTA Principal
- Rectangular, sin border-radius, fondo #4D7CEA, texto blanco
- Padding 12px 25px (nav) o 20px (hero)
- Hover: cambio a #0059CB

### Botón WhatsApp
- Mismo estilo CTA, fondo #25D366, hover ligeramente más oscuro

### Tarjeta de Servicio
- Flexbox column-reverse (imagen arriba, contenido abajo)
- Título uppercase + precio + descripción + "Learn More"
- Sin bordes ni sombras, gap interno 32px

### Footer
- Fondo #1B1B19, padding 144px vertical
- Columnas de enlaces + redes sociales (Facebook, YouTube, Instagram)
- Enlaces de contacto con teléfonos y email
- "Copyright © SKYDIVE INKA PERÚ"

## 6. Layouts Clave (Objetivo)

1. **Hero Inmersivo:** Imagen fullscreen + gradiente overlay + título uppercase + CTA. Altura ~889px.
2. **Grid Servicios:** Tarjetas flex column-reverse, fondo oscuro, títulos blancos alto contraste.
3. **Testimonios:** Carrusel sobre fondo Celeste BG (#F1F4F9) rompiendo paleta oscura.
4. **Menú Overlay:** Pantalla completa, enlaces en columnas, redes sociales inferior.
5. **Footer:** Columnas navegación + social + contacto + legales + copyright.

## 7. URLs de Recursos Gráficos (Cliente)

| Recurso | URL |
|---------|-----|
| Logo Header | https://paracaidismo.pe/wp-content/uploads/2020/10/LogoSkyDive.png |
| Logo Footer | https://paracaidismo.pe/wp-content/uploads/2020/10/LogoSkyDive300.png |
| Isotipo SVG | https://paracaidismo.pe/wp-content/uploads/2020/11/IsoLogocolor-skip-vertical.svg |
| Logo FADS | https://paracaidismo.pe/wp-content/uploads/2020/10/FADS.png |
| Paracaidista | https://paracaidismo.pe/wp-content/uploads/2021/01/ParacaidistaSkyVideo.png |
| Nubes | https://paracaidismo.pe/wp-content/uploads/2020/10/NNubes1.png |
