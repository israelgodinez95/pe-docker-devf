# Prueba de Empleabilidad para un Desarrollador DevOps principiante

## Seccion 1: Conocimientos Generales

### 1.1 Preguntas de Conceptos Básicos: ¿Qué significa DevOps y cuál es su principal objetivo en el desarrollo de software?   

DevOps es una abreviación de Development y Operations, es decir desarrollo y operaciones, es un conjunto de principios para que los equipos de desarrollo de software y los equipos de operaciones TI colaboren de la mejor manera posible.
El principal objetivo de DevOps es mejorar el desarrollo y entrega de productos de software, automatizando, optimizando y haciendo más confiable todo el proceso.

### 1.2 Preguntas sobre Herramientas y Tecnologías: Explica brevemente el propósito de las siguientes herramientas en un entorno DevOps: Jenkins, Docker y Git.

#### Jenkins  

Es útil al ser un servidor de automatización usado para implementar pipelines para Continuos Integration (CI) y Continuous Delivery (CD). Permite gestionar todas las etapas necesarias en el ciclo de vida asociado al desarrollo de software, todo a través de la creación de workflows, testings y generando reportes que sirvan como retroalimentación para un desarrollo de software de mas calidad.

#### Docker  

Docker es una plataforma que permite a los desarrolladores administrar aplicaciones en unidades llamadas contenedores, los cuales tienen todo lo necesario para la ejecución de dichas aplicaciones, como librerías o dependencias. Estos contenedores son ligeros y portables, lo que los hace fáciles de desplegar, manejar y aislar. Docker puede funcionar en conjunto con Jenkins por ejemplo, para realizar pipelines para CD/CI.  

#### Git  

El sistema de control de versiones usado para llevar un registro en los cambios en código que ocurran en nuestro software, se relaciona con DevOps porque sirve como una guía cuando se empiezan a trabajar workflows CD/CI, por ejemplo, si se realiza un cambio en nuestra aplicación y llega a haber algún problema con su funcionamiento, es mas fácil regresar a una versión anterior del código.  

### A continuación se presenta un ejemplo de dockerfile con errores: dockerfile:

<img src="https://github.com/israelgodinez95/pe-docker-devf/blob/main/resources/Captura%20de%20pantalla%202024-02-11%20190011.png" alt="dockerfile" width="400">

### Haz los ajustes/modificaciones necesarios para corregir el siguiente dockerfile.  

El cambio lo haría sobre CMD[“node” , ”index.js”]. Esto es para establecer el comando que se ejecutara sobre la terminal cuando se inicia el contenedor, tiene mas sentido colocar algo que ejecute un scprit que tengamos en nuestro package.json. Quedaria de la siguiente manera:

FROM node:14-alpine   
WORKDIR /app  
COPY package*.json ./  
RUN npm install  
COPY . .  
CMD ["npm" , "run" , "dev"]  

### A continuación se presenta un ejemplo de dockerfile con errores: dockerfile:

<img src="https://github.com/israelgodinez95/pe-docker-devf/blob/main/resources/Captura%20de%20pantalla%202024-02-11%20191020.png" alt="dockerfile" width="400">

### Haz los ajustes/modificaciones necesarios para corregir el siguiente dockerfile.  

En este otro caso eliminaría el (/app/) de (COPY package*.json /app/) porque estos son los archivos que se copiaran a la imagen de Docker, al ser (/app) el directorio en el que se almacena todo lo que se copie a la imagen Docker, no hace mucho sentido. Tambian habria que agregar el (./) al final del comando COPY para que los archivos se copien en el directorio actual. Y como en el caso anterior, lo mismo para el comando CMD [“node” , ”index.js”]. Para este caso, quedaria de la siguiente manera:

- FROM node:14-alpine 
- WORKDIR /app
- COPY package*.json ./
- RUN npm install
- COPY . .
- CMD ["npm" , "run" , "dev"]  

