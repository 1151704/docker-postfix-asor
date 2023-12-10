# Usa una imagen base de Ubuntu
FROM ubuntu:latest

# Actualiza los repositorios e instala Postfix, Dovecot, Nginx y PHP
RUN apt-get update && apt-get install -y postfix dovecot-core dovecot-imapd dovecot-pop3d nginx php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-cli php-zip

# Configura Postfix y Dovecot
COPY postfix-main.cf /etc/postfix/main.cf
COPY dovecot.conf /etc/dovecot/dovecot.

# Instala Roundcube
RUN apt-get install -y wget unzip
RUN wget -O /tmp/roundcube.tar.gz https://github.com/roundcube/roundcubemail/releases/download/RELEASE_VERSION/roundcubemail-RELEASE_VERSION-complete.tar.gz \
    && tar -C /var/www/ -xzvf /tmp/roundcube.tar.gz \
    && mv /var/www/roundcubemail-RELEASE_VERSION /var/www/roundcube \
    && rm /tmp/roundcube.tar.gz

# Configura Nginx para servir Roundcube
# COPY roundcube /var/www/roundcube
COPY roundcube.conf /etc/nginx/sites-available/roundcube.conf
RUN ln -s /etc/nginx/sites-available/roundcube.conf /etc/nginx/sites-enabled/roundcube.conf

# Abre los puertos necesarios para SMTP, IMAP, POP3 y HTTP
EXPOSE 25 143 110 80

# Inicia los servicios al ejecutar el contenedor
CMD service postfix start && service dovecot start && service nginx start && service php7.4-fpm start && bash
