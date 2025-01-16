# Arquitectura
![Architecture Diagram](./public/img/architecture_diagram.png "diagram")
# Configuracion en AWS
## Instancias
* Dos para pruebas (QA)
* Cuatro para produccion (main)

## VPC
* Cuatro subredes, cada una en una zona de disponibilidad a-z diferente
* Cada instancia debe estar desplegada en una subred diferente para asegurar la alta disponibilidad
## Grupo de seguridad
* Para este ejemplo se genero dos diferentes grupos de seguridad, uEl tipo de la imagen se elige indistintamente, pero cada instancia se la desplego en una subred diferente con grupos de seguridad y claves de acceso especificas para cada entorno.
no para QA y otra para main. Los reglas de entrada necesarias son: `SSH`, puerto `:3000` y `HTTP`
## Key pairs
* Una clave para cada ambiente en formato `.pem`
## Aplication Load Balancer

## Auto Scaling Group

# Descripcion del proyecto
Proyecto basico desarrollado con Node.js el cual expone un endpoint `get` en la ruta raiz que devuelve un **Hola mundo** junto al nombre del host en el cual se esta ejecutando
## Despliegue en ec2
El tipo de despliegue en las instancias es via docker, el contenedor internamente trabaja en el puerto 3000 y mapea ese puerto el el 3000 de la instancia
## Resultado
![Resultado end-point](./public/img/result.png "Hello")
# Pipeline
