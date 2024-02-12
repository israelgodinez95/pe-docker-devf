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

FROM node:14-alpine  

WORKDIR /app  

COPY package*.json ./  

RUN npm install  

COPY . .  

CMD ["npm" , "run" , "dev"]  \
  
## Sección 2: Automatización y Orquestación  

### 2.1 Ejercicio Práctico: Utilizando un script de shell, automatiza la creación de un directorio llamado "DevOps_Project" y dentro de él crea tres archivos: "app.js" crea un código de funciones básicas donde te de el resultado de la tabla de multiplicar de un número, "index.html" y "styles.css".

1.- Primero cree el script de shell (.sh) con un editor de texto y lo guarde en mi carpeta PE-DOCKER-DEVF.

2.- Despues ejecute los siguientes comandos usando git bash:  

<img src="https://github.com/israelgodinez95/pe-docker-devf/blob/main/resources/bash%20shell%20excercise.png" alt="dockerfile" width="400">  

El comando: (chmod +x devOpsMultTableTest.sh) es para darle permisos de ejecución al archivo.
La ejecucion del script es con: (./devOpsMultTableTest.sh)  

3.- Puede comprobarse la ejecucion correcta viendo la carpeta y sus archivos desde la terminal o desde Visual Studio Code. Se muestran en la imagen anterior.

4.- Este es el HTML generado usando Live Server.  

<img src="https://github.com/israelgodinez95/pe-docker-devf/blob/main/resources/html%20resultados%20shell%20example.png" alt="dockerfile" width="400">  

### 2.2 Ejercicio Práctico: Crea un archivo Dockerfile e instala las versiones de node [14.x ,16.x,18.x ] con el sistema op. Ubuntu, del ejercicio pasado debe correr la función hecha reciente en un contenedor de docker.

Asi es el archivo Dockerfile que debe ser creado en el mismo directorio que nuestro script de shell:

#Use Ubuntu as the base image  

FROM ubuntu:latest

#Update package lists and install essential tools  

RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    apt-get clean

#Install Node.js 14  

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

#Install Node.js 16  

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

#Install Node.js 18  

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

#Set working directory  

WORKDIR /app

#Copy the shell script into the container  

COPY devOpsMultTableTest.sh /app/

#Set execute permission for the shell script  

RUN chmod +x /app/devOpsMultTableTest.sh

#Run the shell script  

CMD ["/app/devOpsMultTableTest.sh"]  

## Sección 3: Integracion Continua / Entrega Continua (CI/CD)  

### 3.1 Pregunta Teórica: Explica que es la integración continua y como se utiliza en DevOps. Explica que es el despliegue continuo y como se utiliza en DevOps.

### 3.2 Ejercicio Práctico: Describe los pasos básicos que incluirías en un workflow de github actions para una app.

### Seccion 4: Monitoreo y Gestion de Log

### Pregunta Teórica: ¿Por qué es importante implementar el monitoreo en un entorno DevOps y cómo puede beneficiar a un equipo de desarrollo? (crea un ejemplo).