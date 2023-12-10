# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Configura opciones no interactivas para MySQL
ENV DEBIAN_FRONTEND=noninteractive

# Actualiza el sistema e instala las dependencias necesarias
RUN apt-get update
RUN apt-get install -y apache2 roundcube 

# Configura el servidor web Apache
RUN a2enmod rewrite 
RUN service apache2 restart

# Configura MySQL
#COPY mysql-config.cnf /etc/mysql/conf.d/

# Configura Roundcube para usar MySQL
#COPY roundcube-config.inc.php /etc/roundcube/

# Exponer el puerto 80 para acceder a Roundcube
EXPOSE 80

# Inicia los servicios al iniciar el contenedor
CMD service mysql start && apache2ctl -D FOREGROUND