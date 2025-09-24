# Ejemplos de criptografía simétrica con OpenSSL

# Genera una clave secreta
# -aes-256-cbc especifica el algoritmo (AES en este caso)
# -pbkdf2 indica que el metodo que se debe usar para generar
# clave a partir de la contraseña.
# -k especifica la contraseña para generar la clave
# -P indica que se debe mostrar la clave generada
openssl enc -aes-256-cbc -pbkdf2 -k "mi_contraseña" -P

# Cifra un archivo de texto
# -in especifica el archivo de entrada (archivo de texto a cifrar)
# -out especifica el archivo de salida para el archivo cifrado
openssl enc -aes-256-cbc -pbkdf2 -k "mi_contraseña" -in archivos/Texto.txt -out archivos/Texto.txt.enc

# Descifra el archivo cifrado
# -d indica que se debe descifrar el archivo
# -in especifica el archivo de entrada (archivo cifrado)
# -out especifica el archivo de salida para el archivo descifrado
openssl enc -d -aes-256-cbc -pbkdf2 -k "mi_contraseña" -in archivos/Texto.txt.enc -out archivos/Texto.txt.dec

# Tambien es posible pasar la contraseña desde un archivo
openssl enc -aes-256-cbc -pbkdf2 -pass file:cifrado.key -in archivos/Texto.txt -out archivos/Texto.txt.enc


# Verifica que el archivo descifrado es igual al original
diff archivos/Texto.txt archivos/Texto.txt.dec
