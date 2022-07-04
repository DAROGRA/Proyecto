# BUHO, Radar Puntos Ciego

# Autores 💡

* Daniel Andres Rojas Granados ⚡
* Diana Sofia Lopez ⚡
* Juan David Lopez ⚡


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

- [Ultrasonido](/module/verilog/Ultrasonido/)
- [Infrarrojos](/module/verilog/Infrarrojo/)
- [Servomotor (pwm)](/module/verilog/PWM)
- [Motores](/Arduino/Motores)
- [Bluetooth](/Arduino/Bluetooth)
- [Sensor de Temperatura](/Arduino/SensorTemperatura)

## Alimentación:
Para la alminetacion de los perifericos se hizo uso de un arduino UNO, se obtiene una alimentacion de 5V, y se deja igualemnte una tierra en una baquela universal, y se procede a alimentar todos los perifericos por medio de esta baquela. 

## Diseño:
Para el diseño de los cases se realizo un modelado con un periferico por medio del programa de Autodesk Thinkercad, y se montaron los diseños en la siguiente carpeta [Diseño](/Modelos_3D).

## Pruebas de Funcionamiento :
Se encuentra a continuación un enlace con los vídeos de funcionamiento de cada uno de los periféricos y el resultado final. [aqui](https://drive.google.com/drive/folders/112-6SYxrrSyqni91OqtPZYYySc63U7gP?usp=sharing)

- Detección infrarrojo
- Ultrasonido/Giro Izquierda
- Ultrasonido/Giro Derecha
- Servomotor
- Bluetoot
- Sensor de Temperatura y Humedad
- Resultado Final

## Consideraciones Finales :

- Teniendo en cuenta dificultades presentadas dentro de la realización del presente proyecto, se recomienda tener especial cuidado con la conexión de todas las tierras del circuito a un punto fijo, ya que el correcto funcionamiento de algunos módulos (por no decir de todos) depende de esto. Si se llega a tener un movimiento extraño en el [servomotor](/module/verilog/PWM) o si se está recibiendo extraños caracteres por el celular debido al módulo [Bluetooth](/Arduino/Bluetooth), son algunos de los problemas presentados, si no se tiene en cuenta lo anterior.
- Se recomienda realizar un correcto uso del [sensor infrarrojo](/module/verilog/Infrarrojo/) para poder tener un mayor control en el Robot Cartográfico, ya que como se puede ver en el video, al tener líneas paralelas para el frenado, un posible error en la mecánica de los [motorreductores](/Arduino/Motores) ocasionó que fuera necesario tener que reposicionar el robot en el camino.
- El módulo de cámara se encuentra en el repositorio, aunque este no fue posible implementarse finalmente los avances presentados quedan disponibles en la misma carpeta de módulos como ayuda para una posible implementación.
