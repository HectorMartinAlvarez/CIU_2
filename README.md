# CIU_2

Autor: Héctor Miguel Martín Álvarez

## Introducción

Aplicación capaz de crear un modelo 3D a partir de la mitad derecha de un perfil dibujado el usuario.

## Desarrollo

El proyecto ha sido desarrollado empleando 3 ficheros, el fichero principal CIU_2 en el que se implementan los métodos encargados de la visualización del perfil 2D asi como del modelo 3D, los métodos relacionados con los eventos de las pulsaciones de las distintas teclas y los calculos necesarios para la transformación del perfil 2D a modelo 3D. 
Los otros 2 ficheros son 2 clases Point y Shape, donde Point almacena la información de un punto en el espacio y Shape almacena todos los puntos que forma el perfil 2D.

## Caracteristicas

La aplicación se divide en 3 pantallas:
  
  - 1ª Pantalla: Pantalla en la que se dibuja el perfil del modelo, esta dividida por una línea vertial donde en el tercio izquierdo de la pantalla se muestran los controles porque los dos tercios restantes son empleados para dibujar el perfil del modelo.
    - ### Controles 1ª Pantalla
      - Click Izquierdo: Haciendo click podemos seleccionar los puntos del perfil uno por uno. Es posible arrastrar el raton mientras se mantiene el apretado el click para dibujar el contorno del perfil seguido.
      - E: Transforma el perfil dibujado en un modelo 3D y pasa a mostrar la 2º pantalla.
      - R: Borra el dibujo que se encuentre actualmente en pantalla.
      - A: Muestra las figuras guardadas durante la ejecución actual de la aplicación y pasa a mostrar la 3º pantalla.
      - Z: Deshace unicamente la ultima acción realizada sobre el dibujo (Mantener click izquierdo y arrastrar el raton cuenta como una unica accio¡ón hasta que se deja de pulsar el click izquierdo).

  - 2ª Pantalla: Pantalla que muestra el modelo 3D generado a partir del perfil dibujado en la 1ª pantalla.
    - ### Controles 2ª Pantalla
      - +: Amplia la figura generada.
      - -: Aleja la figura generada.
      - C: Cambia el color de la figura generada.
      - S: Guarda la figura generada y vuelve a la 1ª pantalla.
      - D: Descarta la figura generada y vuelve a la 1ª pantalla.

  - 3ª Pantalla: Pantalla que muestra todas las figuras guardadas durante la ejecución actual de la aplicación 
    - ### Controles 3ª Pantalla
      - +: Amplia la figura generada.
      - -: Aleja la figura generada.
      - A: Muestra la anterior figura guardada.
      - D: Muestra la siguiente figura guardada.
      - C: Cambia el color de la figura generada.
      - R: Elimina la figura que se muestre actualmente de las figuras guardadas
      - Q: Vuelve a la 1ª pantalla.

## Herramientas

  - Processing 3.5.4

## Referencia

  - Material de la asignatura Creando Interfaces de Usuario
  - Documentación de Processing

![Error showing gif :(](https://github.com/HectorMartinAlvarez/CIU_2/blob/main/CIU_2/animation.gif)
