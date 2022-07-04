# Firmware
## Funciones de prueba
Una vez construído nuestro SoC, tenemos a nuestra disposición todos los módulos construídos, para usarlos de la manera que definamos. Para aprovecharlos, debemos escribir el software que los va a controlar y de esta manera los pondrá a nuestra orden.

Para construir nuestro firmware, tenemos que tener claro cómo funcionan nuestros módulos y qué podemos leer y escribir de ellos. Sabiendo esto, Litex y Migen se han encargado de abstraer estos procesos mediante funciones generadas que se encuentran en el archivo [CSR.h](https://github.com/DAROGRA/Proyecto/blob/main/build/nexys4ddr/software/include/generated/csr.h) que podremos utilizar al escribir el programa que ejecutará nuestro SoC.

En nuestro caso, se escribieron funciones de prueba para cada módulo implementado con el objetivo de comprobar su respectiva operabilidad y, por supuesto, el programa principal con el cual el carro se encontrará en capacidad de recorrer un laberinto, reconocer su entorno y transmitir la información encontrada a un usuario por medio de la terminal y el modulo Bluethooth.

A continuación presentaremos las funciones integradas junto con sus respectivas explicaciones.

### test_us()
```C
static void US_test(void)
{
	printf("Test del los leds... se interrumpe con el botton 1\n");
	while(!(buttons_in_read()&1)) {
			int done=us_driver_medida_read();
			printf("distancia: %d \n",done);
		delay_ms(200);
	}

}

```
Este difiere en que el módulo de ultrasonido no tiene lecturas repetidas sino que se le debe dar la orden realizar todo el proceso relacionado con hacer la respectiva medición y de la misma manera establecer un reset para que este esté disponible para hacerla nuevamente. se imprime el valor de la distancia en consola


### pwm_test()
```C
static void test_pwm(void){
int posicionn=0;
while(!(buttons_in_read()&1)) {
			if(posicionn==7){
			    dir=-1;
			}
			if(posicionn==1){
			    dir=1;
			}
}
```

Se prueba usar el servo con distancaias de angulo de 0 a 180° teniendo 7 cambios de estado

### uart_test()
```C
static void uart3_test(void){
	uart1_write(preubalect);
	delay(30ms)
}
```
Prueba de la escritura del modulo de Bluetooth.


### uart_read()
```C
static void uart3_test(void){
	uart1_read(preubalect);
	delay(30ms)
}
```



# ¿Cómo compilar y subir el firmware?
Una vez tenemos el firmware completamente escrito, tendremos que compilarlo en un archivo binario legible para el SoC. Este paso resulta sencillo debido a que es exactamente como compilar en el lenguaje C, además de que contamos con un archivo makefile por lo que el proceso que seguiremos inicia con asegurarnos de:
- Tener añadido el Path de Litex en la terminal
- Haber guardado todos los cambios en nuestros archivos de C.
Una vez hecho esto, abrimos una terminal en este directorio y ejecutamos el comando:
```ssh
make all
```
Comando que debe resultar sin errores y, una vez hecho esto, ya tenemos a nuestra disposición un archivo `firmware.bin` que podremos subir al SoC mediante la terminal de litex, abriendo una terminal en el directorio raíz del proyecto y ejecutando los comandos:
```ssh
sudo chmod 777 /dev/ttyUSB1
litex_term /dev/ttyUSB1 --kernel firmware/firmware.bin
```
