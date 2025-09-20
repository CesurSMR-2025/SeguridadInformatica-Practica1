#!/bin/bash
# Ejemplo de cifrado asimétrico con OpenSSL

# Genera un par de claves (pública y privada)
# algorithm especifica el algoritmo (RSA en este caso)
# -out especifica el archivo de salida para la clave privada
# -pkeyopt especifica opciones para la generación de claves
# rsa_keygen_bits especifica el tamaño de la clave en bits (2048 bits en este caso)
# La clave privada se guarda en private_key.pem y la clave pública en public_key.pem
openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048

# Extrae la clave pública de la clave privada
# -pubout indica que se debe extraer la clave pública
# -in especifica el archivo de entrada (clave privada)
# -out especifica el archivo de salida para la clave pública
# La clave pública se guarda en public_key.pem
openssl rsa -pubout -in private_key.pem -out public_key.pem

# Cifra un archivo de texto con la clave pública
# rsautl es una utilidad de OpenSSL para operaciones con RSA
# -encrypt indica que se debe cifrar el archivo
# -inkey especifica el archivo de la clave (clave pública en este caso)
# -pubin indica que la clave de entrada es una clave pública
# -in especifica el archivo de entrada (archivo de texto a cifrar)
# -out especifica el archivo de salida para el archivo cifrado
openssl rsautl -encrypt -inkey public_key.pem -pubin -in archivos/Texto.txt -out archivos/Texto.txt.enc

# Descifra el archivo cifrado con la clave privada
# -decrypt indica que se debe descifrar el archivo
# -inkey especifica el archivo de la clave (clave privada en este caso)
# -in especifica el archivo de entrada (archivo cifrado)
# -out especifica el archivo de salida para el archivo descifrado
openssl rsautl -decrypt -inkey private_key.pem -in archivos/Texto.txt.enc -out archivos/Texto.txt.dec

# Verifica que el archivo descifrado es igual al original
# diff compara dos archivos línea por línea
# Si los archivos son iguales, diff no produce salida y el comando echo indica que son iguales
# Si los archivos son diferentes, diff produce salida y el comando echo indica que son diferentes
diff archivos/Texto.txt archivos/Texto.txt.dec && echo "El archivo descifrado es igual al original" || echo "El archivo descifrado es diferente al original"

# Limpiar archivos generados
rm private_key.pem public_key.pem archivos/Texto.txt.enc archivos/Texto.txt.dec
