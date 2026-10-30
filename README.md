# OpenCloud Desktop on Linux

OpenCloud Desktop en Linux (cliente).
No instala servidor.

OpenCloud en Linux no es doble clic.
Es instalación real, ejecución por consola y control.

## Paso previo

Descargar AppImage:

curl -L https://releases.opencloud.io/OpenCloud-latest.AppImage -o OpenCloud.AppImage
chmod +x OpenCloud.AppImage

## Uso

chmod +x install.sh start.sh stop.sh check.sh uninstall.sh
./install.sh
./start.sh
./check.sh

## Alcance y precauciones

Esta guía corresponde al **cliente de escritorio para Linux**, no al servidor OpenCloud. Los scripts del repositorio deben revisarse antes de ejecutarlos; no se garantiza compatibilidad con todas las distribuciones.

## Verificación manual

1. Confirmá la arquitectura del equipo: `uname -m`.
2. Revisá el archivo descargado con `file OpenCloud.AppImage` y comprobá su origen y firma o checksum si el proveedor los publica.
3. Inspeccioná los scripts: `less install.sh`, `less start.sh`, `less stop.sh`, `less check.sh`, `less uninstall.sh`.
4. Ejecutá la instalación y el inicio con los comandos indicados arriba.
5. Corré `./check.sh` y verificá además que la aplicación abra correctamente.
6. Para detenerla, utilizá `./stop.sh`; consultá `uninstall.sh` antes de eliminar archivos.

**Importante:** un código de salida correcto de un script no demuestra por sí solo que la aplicación funcione. Esta sección describe una lista de comprobación, no una prueba ejecutada en todas las versiones de Linux.

## Problemas frecuentes

- **Permiso denegado:** revisá los permisos de ejecución del AppImage y de los scripts.
- **AppImage no inicia:** comprobá arquitectura, bibliotecas y mensajes de la terminal; algunas distribuciones requieren soporte FUSE.
- **Descarga fallida:** verificá la URL de distribución oficial antes de reintentar; no ejecutes un archivo incompleto.
- **Desinstalación:** revisá qué rutas modifica el script y conservá una copia de cualquier configuración que quieras preservar.
