# Ejemplos de criptografía hash con sha256sum

# sha256sum es una utilidad que calcula y verifica hashes SHA-256
# archivos/Texto.txt es el archivo de entrada
# > archivos/Texto.txt.sha256 redirige la salida al archivo archivos/Texto.txt
sha256sum archivos/Texto.txt > archivos/Texto.txt.sha256

# Verifica la integridad del archivo
# -c indica que se debe comprobar el hash
# archivos/Texto.txt.sha256 es el archivo que contiene el hash
sha256sum -c archivos/Texto.txt.sha256

# Limpiar archivos generados
rm archivos/Texto.txt.sha256

# Igual que para los otros tipos de cifrado, se puede usar otros algoritmos y cualquier tipo de archivo
# Al ser la creación de un hash una operación rápida, se pueden utilizar archivos grandes sin problemas
sha256sum archivos/Imagen.png > archivos/Imagen.png.sha256
sha256sum -c archivos/Imagen.png.sha256
rm archivos/Imagen.png.sha256

sha512sum archivos/video.mp4 > archivos/video.mp4.sha512
sha512sum -c archivos/video.mp4.sha512