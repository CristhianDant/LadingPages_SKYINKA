# Skydive Dubai - Design System Specification

## 1. Visión General

Estética inmersiva de alto impacto con minimalismo brutalista. Fondos oscuros realzan fotografías de acción, acentos rojos transmiten urgencia y tipografía condensada bold proyecta adrenalina y exclusividad premium.

## 2. Paleta de Colores

| Nombre Lógico | Valor HEX | Uso Asignado |
|---------------|-----------|--------------|
| Primary Action | #DA291C | Botones CTA, énfasis visual |
| Primary Hover | #AE2116 | Estados hover interactivos |
| Background Dark | #1B1B19 | Navbar, footer, secciones oscuras |
| Background Neutral | #232424 | Footer específico |
| Surface Light | #F8EAE8 | Testimonios, fondos claros |
| Text Primary | #FFFFFF | Textos sobre fondos oscuros |
| Text Secondary | #B1B3B3 | Navegación, textos soporte |
| Text Dark | #000000 | Textos sobre fondos claros |
| Border Neutral | #E0E1E1 | Separadores secundarios |
| Accent Gold | #FFD100 | Elementos decorativos |

## 3. Tipografía

| Familia | Pesos | Aplicación |
|---------|-------|------------|
| Bemartin 1 / Impact | Regular 400 | Títulos H1-H3, headlines hero |
| Arial | Regular 400, Medium 500 | Body, párrafos, navegación |

**Jerarquía:** H1 Hero 59px uppercase (line-height 1:1) · H2 59px · H3 36px · Body 14px · Nav 14.24px medium uppercase (letter-spacing 0.25px)

## 4. Espaciado y Efectos

- **Border-radius:** 0px (esquinas cuadradas brutalistas)
- **Box-shadow:** No se utilizan
- **Padding secciones:** 64px estándar, 122px hero (compensa navbar), 144px footer
- **Contenedores:** Max-width 1248px, padding horizontal 20px
- **Gap grids:** 32px entre tarjetas de servicio
- **Transiciones:** `transition: all` suave en interactivos

## 5. Anatomía de Componentes

### Header
- Fixed, fondo #1B1B19 opaco, 84px alto, z-index 4
- Logo izquierda (45px), navegación + acciones derecha
- Se mantiene fijo al scroll con animación sutil

### Menú Overlay
- Pantalla completa, fondo #1B1B19
- Columnas: EXPERIENCES/LICENSED SKYDIVERS/SCHOOL · SPECIAL PROJECTS/NEWS & EVENTS/ABOUT US · GALLERY/CONTACT US/FAQS/CAREERS
- Enlaces uppercase 36px, redes sociales en parte inferior

### Botón CTA Principal
- Rectangular, sin border-radius, fondo #DA291C, texto blanco
- Padding 12px 25px (nav) o 20px (hero)
- Hover: cambio a #AE2116

### Tarjeta de Servicio
- Flexbox column-reverse (imagen arriba, contenido abajo)
- Título uppercase + precio + descripción + "Learn More"
- Sin bordes ni sombras, gap interno 32px

### Footer
- Fondo #1B1B19, padding 144px vertical
- Dos columnas de enlaces + redes sociales (Instagram, Facebook, TikTok, YouTube, LinkedIn, X)
- Enlaces legales + "Copyright © SKYDIVE DUBAI 2026"

## 6. Interacción 'Book Now'

El botón CTA de navegación debe ejecutar smooth scroll hacia la sección de Tarjetas de Servicio. En páginas internas (/book-your-experience), redirige directamente a reservas.

## 7. Layouts Clave

1. **Hero Inmersivo:** Imagen fullscreen + gradiente overlay + título uppercase + CTA. Altura ~889px.
2. **Grid Servicios:** Tarjetas flex column-reverse, fondo oscuro, títulos blancos alto contraste.
3. **Testimonios:** Carrusel sobre fondo claro #F8EAE8 rompiendo paleta oscura.
4. **Menú Overlay:** Pantalla completa, enlaces en columnas, redes sociales inferior.
5. **Footer:** Dos columnas navegación + social + legales + copyright.
