# Esteban's Company Job Portal

## Descripción

Este es un portal de ofertas de trabajo creado por Esteban. Aquí, los usuarios pueden ver ofertas de trabajo, aplicar a ellas, y los administradores pueden gestionar tanto las ofertas como las aplicaciones.

## Características

- Registro y autenticación de usuarios
- Creación y gestión de ofertas de trabajo
- Aplicación a ofertas de trabajo
- Panel de administración para gestionar usuarios y aplicaciones

## Tecnologías Utilizadas

- Ruby on Rails
- PostgreSQL
- Bootstrap
- Devise

## Instalación Local

1. Clonar el repositorio

git clone https://github.com/Esteban/estebanscompany.git

2. Navegar al directorio del proyecto

cd EstebansCompany

3. Instalar las dependencias

bundle install

4. Crear la base de datos

rails db:create

5. Ejecutar las migraciones

rails db:migrate

6. Iniciar el servidor

rails server


## Despliegue en Heroku

1. Instalar Heroku CLI y autenticarse

heroku login

2. Crear una nueva aplicación en Heroku

heroku create

3. Añadir la base de datos de Heroku

heroku addons:create heroku-postgresql:hobby-dev


4. Desplegar la aplicación

git push heroku master

5. Ejecutar las migraciones en Heroku

heroku run rails db:migrate


## Credenciales de Administrador

- Email: esteban@a.a
- Contraseña: 123456

## Credenciales de Usuarios

- Email: a@a.a
- Contraseña: 123456

- Email: b@a.a
- Contraseña: 123456

## Pruebas

Las pruebas no se pudieron realizar debido a fallos en la ejecución.

## Contribuciones

Si tienes alguna sugerencia o mejora, no dudes en hacer un pull request.

## Licencia

Este proyecto está bajo la licencia MIT.

