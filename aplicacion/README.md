# Diseño de la aplicacion

# PARTES

![Screenshot](/aplicacion/Recepcion.jpeg)

Este bloque se encarga de recibir la información transmitida por el módulo Bluetooth, la cual se configuró para enviar una concatenación de cuatro números, donde los 3 más significativos son la distancia medida por el sensor de ultrasonido en cm, y el menos significativo es un número entre 1 y 7, el cual representa la dirección en la que se esta apuntando el ultrasonido. Estas direcciones son un ángulo entre 0° y 180°  dado por la posición del servomotor: 


| Posición |   Ángulo(°) |
| --- | --- |
| 1 | 0 |
| 2 | 30 |
| 3 | 60 |
| 4 | 90 |
| 5 | 120 |
| 6 | 150 |
| 7 | 180 |


Ejemplo: El servomotor se encuentra apuntando en dirección de 90° y mide una distancia de 90 cm. La señal recibida es 0904. Al tomar el módulo de este valor entre 10 la variable Estado será 4, y al dividir entre 10, la variable Radio será 090 al ser de tipo entero.

![Screenshot](/aplicacion/State2Angulo.jpeg)

Estos bloques se encargan de convertir la variable Estado, en el ángulo correspondiente a la tabla mostrada previamente.


![Screenshot](/aplicacion/Polare2Cartesianas.jpeg)

Este código se encarga de convertir de coordenadas polares a coordenadas cartesianas los valores recibidos anteriormente, y adicionalmente los ajusta a las proporciones de la pantalla del dispositivo utilizado.

![Screenshot](/aplicacion/Origen.jpeg)

este bloque se encarga de centrar el origen en un punto determinado de la pantalla, y posteriormente graficar el punto en la posición deseada.

![Screenshot](/aplicacion/Distancia.jpeg)

Este bloque se encarga de mostrar el valor de la distancia a la que se encuentra el objeto en metros, y en caso de que esta sea mayor a 2 m , muestra un mensaje de que no hay objetos visibles.

![Screenshot](/aplicacion/Direccionales.jpeg)

Este código se encarga de enviar un número de 1 o 7 en caso de oprimir las flechas de derecha o izquierda, con el fin de ubicar el servomotor en dicha dirección, de manera que cuando el vehículo se disponga a girar, se cubra correctamente.

# Pruebas en la tablet:

![Screenshot](/aplicacion/Prueba_radar.jpeg)

Prueba del radar

![Screenshot](/aplicacion/Ningun_Objeto.jpeg)

Prueba ningun Objeto


![Screenshot](/aplicacion/Deteccion_de_Objeto.jpeg)
Prueba con un objeto cercano
