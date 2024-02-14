# Proyecto Andimar

## Comenzando 🚀
_Estas instrucciones te permitirán obtener una copia del esqueleto en funcionamiento en tu máquina local para propósitos de desarrollo y pruebas._

### Pre-requisitos 📋

-   Docker 19.03^
-   Docker Compose 1.25^
***

## Instalación 🔧

1. Clonar el repositorio
    ```
    git clone ...
    ```

2. Crear copia de variables de entorno
    ```
    cp .env.example .env
    ```

3. Contruir el contenedor
    ```
    make build
    ```
4. Levantar el contenedor
    ```
    make up
    ```
5. Ejecutar migraciones
    ```
    make migrate
    ```
6. Crear superusuario
    ```
    make superuser
    ```
***

## Despliegue en ambiente de development 🚀
Para realizar los cambios en el ambiente de desarrollo:
1. Ingresar al servidor de desarrollo
    ```
    ssh ubuntu@3.226.69.123
    ```
2. Ingresar a la carpeta de backend de andimar
    ```
    cd andimar/backend/
    ```
3. Bajar los cambios
    ```
    git pull origin develop
    ```
4. Ejecutar migraciones (en caso de que haya cambios en la bd)
    ```
    docker-compose -f docker-compose.dev.yml exec web bash -c "python manage.py migrate"
    ```
5. En caso de cambios en variables de entorno, bajar y ejecutar el contenedor
    ```
    docker-compose -f docker-compose.dev.yml stop
    docker-compose -f docker-compose.dev.yml up -d
    ```

## Despliegue en ambiente de staging 🚀
Para realizar los cambios en el ambiente de staging:
1. Ingresar al servidor de staging
    ```
    ssh ubuntu@52.44.195.242
    ```
2. Ingresar a la carpeta de backend de andimar
    ```
    cd andimar/backend/
    ```
3. Bajar los cambios
    ```
    git pull origin staging
    ```
4. Ejecutar migraciones (en caso de que haya cambios en la bd)
    ```
    docker-compose -f docker-compose.qa.yml exec web bash -c "python manage.py migrate"
    ```
5. En caso de cambios en variables de entorno, bajar y ejecutar el contenedor
    ```
    docker-compose -f docker-compose.qa.yml stop
    docker-compose -f docker-compose.qa.yml up -d
    ```

## Despliegue en ambiente de producción 🚀
Actualmente el servidor de producción usa kubernetes por lo que no es tan sencillo de desplegar
como los ambientes de desarrollo y staging. Tomar en cuenta que existe una numeración en los despliegues
que se debe ir incrementando.
1. Ingresar al servidor de producción
    ```
    ssh ubuntu@34.239.193.199
    ```
2. Ingresar a la carpeta de backend de andimar
    ```
    cd andimar/backend/
    ```
3. Bajar los cambios
    ```
    git pull origin develop
    ```
4. Iniciar sesión en aws para subir las imágenes
    ```
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 072842301696.dkr.ecr.us-east-1.amazonaws.com
    ```
5. Construir la imagen
    ```
    docker build -t backend-andimarv24 -f compose/development/Dockerfile .
    ```
6. Taggear la imagen con su numeración respectiva (si antes había v24 ahora debería ser v25)
    ```
    docker tag backend-andimarv25 072842301696.dkr.ecr.us-east-1.amazonaws.com/backend:rev25
    ```
7. Subir la imagen al repositorio de imagenes de aws (si antes había v24 ahora debería ser v25)
    ```
    docker push 072842301696.dkr.ecr.us-east-1.amazonaws.com/backend:rev25
    ```
8. Modificar los pods de kubernetes (backend y worker) para que use la imagen subida
    En la consola saldrá un archivo de configuración que se tiene modificar la sección de "image"
    actualizando a la nueva versión v24 ahora debería ser v25
    ```
    kubectl edit deployment backend -n backend
    kubectl edit deployment worker -n backend
    ```
9. Para ejecutar migraciones o un comando se debe obtener el nombre del pod
    ```
    kubectl get pods -n backend
    ```
9. Con el nombre se debe ejecutar el comando
    ```
    kubectl -n backend exec <nombre-pod> -- python manage.py <migrate|command>
    ```

## Misc
En caso de tener error en las pruebas por falta de accesos para crear una base de datos.
Ejecutar la siguiente instrucción dentro del contenedor de la base de datos:
```
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "grant all privileges on *.* to '${MYSQL_USER}'@'%';"
```
***

## Utilitarios 💻
- Ver servicios disponibles en el proyecto: [http://localhost:8000/api/schema/redoc/](http://localhost:8000/api/schema/redoc/)
***

## Referencias 📖
- Projecto basado en el libro: Django 3 Web Development Cookbook Fourth Edition ([Enlace al libro](https://www.packtpub.com/product/django-3-web-development-cookbook-fourth-edition/9781838987428))
- Testing con pytest en django
    - [Enlace 1](https://djangostars.com/blog/django-pytest-testing/)
    - [Enlace 2](https://dev.to/sherlockcodes/pytest-with-django-rest-framework-from-zero-to-hero-8c4)
    - [Enlace 3](https://stackoverflow.com/questions/47576635/django-rest-framework-jwt-unit-test)

***
⌨️ con ❤️ por Linets 🧑‍💻

---