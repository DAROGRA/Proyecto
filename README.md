# BUHO, Radar Puntos Ciego

# Autores 💡

* Daniel Andres Rojas Granados ⚡
* Diana Sofia Lopez ⚡
* Juan David Lopez ⚡

#INFORME 📚
https://www.overleaf.com/read/frnqhqvtksbk


Este es el repositorio del Robot Cartógrafo para la Asignatura de Electrónica Digital II de la Universidad Nacional de Colombia -  Sede Bogotá. El robot cartógrafo se realizó bajo una arquitectura de SoC, en una tarjeta de desarrollo Nexys A7, y periféricos los cuales sirven para cumplir el objetivo del proyecto, su funcionamiento principal radica en la generación de un vector donde se encuentran las direcciones del robot en cada instante de tiempo según el análisis del entorno en el que se encuentra por medio del sensor de ultrasonido, sensores infrarrojos y envio de datos por medio de bluetooth, y por otra parte se tiene un registro de la temperatura y humedad de las condiciones ambientales a las cuales esta sometido, siendo este nuestro periférico adicional.

![Screenshot](/Graficos/ciegos.jpg)

Como periféricos se implementaron un Sensor de ultrasonido HC-sr04 el cual es usado para la deteccion de vehiculos en un rango de 2 metros por medio de ondas de sonido, tambien se usa un Módulo Bluetooth HC06 el cual permite la comunicacion entre los datos recibidos del sensor y el servo motor, para ser enviados hasta un dispositivo que reciba los datos y los grafique en una interfaz grafica, para lograr un movimiento del sensor se usa adicionalmente un Servomotor MG90, el cual esta caracterizado por 6 estados para realiar un barrido de 180° recubriendo el punto ciego trasero de los camiones.

Se presenta un diagrama con las conexiones entre los diferentes periféricos y el SoC:

![Screenshot](/Graficos/SoC.png)

El mapa de memoria se presenta a continuación.
| csr_base| Direccion |
| ------------- | ------------- |
|leds|0x82000000|
|switchs|0x82000800|
|buttons|0x82001000|
|display|0x82001800|
|ledRGB_1|0x82002000|
|ledRGB_2|0x82002800|
|servomotor_ctr|0x82003000|
|ultrasound_ctr|0x82003800|
|uart_txrx|0x82004800|
|ctrl|0x82005004|
|timer0|0x82005800|
|uart|0x82006000|

## [Firmware](/firmware/) :
Se presenta la información del código usado para el desarrollo del funcionamiento del radar y principalmente el archivo [main.c](/firmware/main.c). 

## [Periféricos](/module) :
En cada uno de los links se presenta el módulo en verilog y una explicación detallada del código utilizado para su funcionamiento.

- [Ultrasonido](/module/verilog/ultrasonidoprueba)
- [Servomotor (pwm)](module/verilog/Servo/ServoRadar.v)
- [Bluetooth](/firmware/uart1.c)

En el caso del Ultrasonido se tienen cargados los archivos de drivers usados para el funcionamiento del  periferico, [Libreria US](/module/verilog/ultrasonidoprueba/DIVISION_ULTRASONICO_RevA.vhd), [Libreria US](/module/verilog/ultrasonidoprueba/INTESC_LIB_ULTRASONICO_RevC.vhd), y un Top donde se llaman las entradas y salidas en vhdl [TOP US](/module/verilog/ultrasonidoprueba/sensor_prueba.vhd), para el caso del servomotor se crearon desde verilog los estados en los que estaria el motor [Servo](/module/verilog/Servo/ServoRadar.v) y para el modulo de transmision y recepcion por medio de Bluerooth se tiene el codigo por medio de c: [Bluetooth](/firmware/uart1.c)

## Alimentación:
Para la alminetacion de los perifericos se hizo uso de un arduino UNO, se obtiene una alimentacion de 5V, y se deja igualemnte una tierra en una baquela universal, y se procede a alimentar todos los perifericos por medio de esta baquela. 


## Aplicacion:
Se diseño por medio de la pagina Kodula, la cual permite la creacion de programas para android por medio del desplazamiento de bloques, todo el diseño y explicacion de los bloques esta en [App](/module/verilog/Servo/ServoRadar.v)

## Diseño:
Para el diseño de los cases se realizo un modelado con un periferico por medio del programa de Autodesk Thinkercad, y se montaron los diseños en la siguiente carpeta [Diseño](/Modelos_3D).

## Pruebas de Funcionamiento :

Para el caso del ultrasonido se realizo la medicion de distancia y se tiene: [PruebasUS](/Graficos/20220630_160500.mp4)

Para el caso del servomotor se revisa el funcionamiento de la lectura en la posicion en la que se encuentra: [PruebasServo](/Graficos/20220630_160546.mp4)

Para la prueba del Modulo se envia a la tablet primero una posicion con una distancia fija desde la aplicacion: [PruebaBT](/Graficos/radar.mp4)

Pruebas conjuntas [PruebasUS](/Graficos/20220630_160500.mp4)

## Consideraciones Finales : [PruebasUS](/Graficos/20220630_153829.mp4)

- Para el caso de la tablet se deja planteado un nuevo funcionamiento el cual consiste en la creacion de un nuevo estado por medio del cual se agregan direccionales por medio de las cuales se puede fijar el servomotor en la direccion por donde se plantee girar, con el fin de tener una mayor precision de los objetos que puedan estar demasiado cerca al momento de realizar el giro.
- Se recomienda un manejo del formato en el que se envia y reciben los datos del modulo Bluetooth [Bluetooth](/firmware/uart1.c), debido a que su funcion esta creada para el envio de 1 CHAR a la vez y el modulo de Bluetooth esta diseñado para el envio de 8 bits, por lo que pueden haber errores con los datos que se envian al trabajr con Int, ASCII, entre otros
- Es imporatante conocer lo que se envia en la aplicacion que se diseño debido a que el programa que se realizo puede tener problemas al leer tamaños de bloques y formatos de datos.
