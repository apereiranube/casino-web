# Materiales reales (opcionales)

Si dejás acá archivos con estos nombres, la ruleta los usa en lugar de las texturas procedurales
(se detectan al iniciar `pnpm dev` / al hacer `build`). Lista completa y de dónde bajarlos:
`arte/pedidos.md` → "Materiales PBR y HDRI (Poly Haven, CC0)".

madera_color.(ktx2|jpg|png)   madera_normal.*   madera_rugosidad.*
pano_color.*                  pano_normal.*     pano_rugosidad.*
metal_rugosidad.*             studio.hdr

Instalados hoy (Poly Haven, CC0; detalle y procesos en `arte/materiales.md`): madera_color.jpg
(2K, calidad alta), madera_color_1k.jpg (media/baja), madera_normal.jpg, madera_rugosidad.jpg y
studio.hdr (Studio Small 03, 1K). `<nombre>_1k.<ext>` = versión reducida para media y baja.
