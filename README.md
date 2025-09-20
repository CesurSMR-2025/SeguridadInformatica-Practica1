# SeguridadInformatica - Practica1: Criptografía
El objetivo de esta práctica es entender y familiarizarse con los 3 tipos de criptografía: simétrica, asimétrica y hash. Sobre estos de criptografías es que se implementan los sistemas de seguridad digitales que usamos a diario.

### Preparación del Entorno
Para esta práctica utilizaremos `opensssl` que es una herramienta de línea de comandos que nos permite realizar operaciones criptográficas. En la mayoria de las distribuciones de Linux, incluyendo la maquina virtual proporcionada, `openssl` ya viene instalado. Si no lo tienes instalado, puedes hacerlo usando el gestor de paquetes de tu distribución. Por ejemplo, en Debian/Ubuntu puedes usar:
```bash
sudo apt-get install openssl
```
Aunque `openssl` tambien incluye soporte para criptografía hash, para esta práctica usaremos la herramienta `sha256sum` que también viene preinstalada en la mayoría de las distribuciones de Linux. Si no la tienes instalada, puedes hacerlo usando el gestor de paquetes de tu distribución. Por ejemplo, en Debian/Ubuntu puedes usar:
```bash
sudo apt-get install coreutils
```

### Criptografía Simétrica
En la criptografía simétrica, la misma clave se utiliza tanto para cifrar como para descifrar la información. Para esta parte de la práctica, utilizaremos el algoritmo AES (Advanced Encryption Standard) con una clave de 256 bits.

Explicado de una forma mas matemática

$$C = E(K, P)$$
$$P = D(K, C)$$

Sea:
- $C$: Texto cifrado (Ciphertext)
- $P$: Texto plano (Plaintext)
- $K$: Clave (Key)
- $E$: Función de cifrado (Encryption function)
- $D$: Función de descifrado (Decryption function)

Como es lógico, para que este sistema funcione, tanto el emisor como el receptor deben conocer la clave $K$ y mantenerla en secreto. El hecho de distribuir y gestionar las claves de forma segura es uno de los principales desafíos de la criptografía simétrica.

Cabe mencionar tambien que en la mayoria de los casos la función de cifrado y la de descifrado son inversas matemáticamente, es decir, aplicar la función de descifrado a un texto cifrado con la misma clave nos devuelve el texto plano original. Es decir, aplicar la función de descifrado es como "deshacer" la función de cifrado, aplicando la inversa de sus operaciones matemáticas.


### Criptografía Asimétrica
En la criptografía asimétrica, se utilizan dos claves diferentes: una clave pública y una clave privada. Las claves están matemáticamente relacionadas, pero no es posible obtener la clave privada a partir de la clave pública y viceversa. Ambas claves se utilizan para cifrar y descifrar la información, pero de manera diferente. Los datos cifrados con la clave pública solo pueden ser descifrados con la clave privada correspondiente, y los datos cifrados con la clave privada solo pueden ser descifrados con la clave pública correspondiente. 

Explicado de una forma mas matemática:
$$C = E(K_{pub}, P)$$
$$P = D(K_{priv}, C)$$
$$C' = E(K_{priv}, P)$$
$$P = D(K_{pub}, C')$$

Sea:
- $C$: Texto cifrado (Ciphertext)
- $P$: Texto plano (Plaintext)
- $K_{pub}$: Clave pública (Public Key)
- $K_{priv}$: Clave privada (Private Key)
- $E$: Función de cifrado (Encryption function)
- $D$: Función de descifrado (Decryption function)

### Criptografía Hash
### Entregable