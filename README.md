# BUHO, Radar Puntos Ciego

# Autores 💡

* Daniel Andres Rojas Granados ⚡
* Diana Sofia Lopez ⚡
* Juan David Lopez ⚡


Este es el repositorio del Robot Cartógrafo para la Asignatura de Electrónica Digital II de la Universidad Nacional de Colombia -  Sede Bogotá. El robot cartógrafo se realizó bajo una arquitectura de SoC, en una tarjeta de desarrollo Nexys A7, y periféricos los cuales sirven para cumplir el objetivo del proyecto, su funcionamiento principal radica en la generación de un vector donde se encuentran las direcciones del robot en cada instante de tiempo según el análisis del entorno en el que se encuentra por medio del sensor de ultrasonido, sensores infrarrojos y envio de datos por medio de bluetooth, y por otra parte se tiene un registro de la temperatura y humedad de las condiciones ambientales a las cuales esta sometido, siendo este nuestro periférico adicional.

![Screenshot](/Imágenes/Carro1.jpeg)

Como periféricos se implementaron un sensor de temperatura SHT31, un sensor infrarrojo seguidor de línea de 5 canales, 2 motores-reductores conectados a un puente H, un módulo bluetooth, un servo motor y un ultradonido HC-sr04. Se utilizó también un microprocesador Arduino Mega 2560 para realizar algunas conexiones y control de algunos procesos, los cuales se describirán más adelante. 

Se presenta un diagrama con las conexiones entre los diferentes periféricos y el SoC:
![Screenshot](/Imágenes/SoC.jpg)

El mapa de memoria se presenta a continuación.
| csr_base| Direccion |
| ------------- | ------------- |
|leds|0x82000000|
|switchs|0x82000800|
|buttons|0x82001000|
|display|0x82001800|
|ledRGB_1|0x82002000|
|ledRGB_2|0x82002800|
|vga_cntrl|0x82003000|
|uart1|0x82004000|
|uart2|0x82005000|
|uart3|0x82006000|
|infra_cntrl|0x82006800|
|pwm_cntrl|0x82007000|
|ultrasonido|0x82007800|
|ctrl|0x82008000|
|timer0|0x82008800|
|uart|0x82009000|

## [Firmware](/firmware/) :
Se presenta la información del código usado para el desarrollo del funcionamiento del robot cartógrafo y principalmente el archivo [main.c](/firmware/main.c). 

## [Periféricos](/module) :
En cada uno de los links se presenta el módulo en verilog y una explicación detallada del código utilizado para su funcionamiento.

- [Ultrasonido](/module/verilog/Ultrasonido/)
- [Infrarrojos](/module/verilog/Infrarrojo/)
- [Servomotor (pwm)](/module/verilog/PWM)
- [Motores](/Arduino/Motores)
- [Bluetooth](/Arduino/Bluetooth)
- [Sensor de Temperatura](/Arduino/SensorTemperatura)

## Alimentación:
Se alimentan los periféricos a través de una extensión y un cargador de 5V/2A. El puente H se alimenta con 8 pilas AA para alcanzar los 12 voltios requeridos y la corriente que necesitan los motores para mover el carro. Debido a algunos inconvenientes con la alimentación de la FPGA y el Arduino, estos se conectan a los puertos USB del computador y se debe mover el computador según la ruta que siga el robot.

## Diseño:
Se realizó un diseño para impresión en 3D de la base del carro cartógrafo y se presentan todos los documentos de diseño en el siguiente enlace [Diseño](/Diseño).

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
