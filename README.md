# Docker Postfix ASOR

El siguiente contenedor configura un servidor de correos con postfix.

## Instalar 

```
chmod +x install-docker.sh
./install-docker.sh
apt install docker-compose 
```

### Configure nameserver
Configure con el editor de texto de su preferencia el archivo: resolv.conf
Adicione el nameserver con la ip del host
```
nano /etc/resolv.conf
---------------------
nameserver {IP_HOST}
nameserver 127.0.0.53
options edns0 trust-ad
search .
```

## Docker compose

```
docker-compose up -d
```

### Error de puerto:
Si se encuentra con el siguiente error:
*Error starting userland proxy: listen tcp4 0.0.0.0:53: bind: address already*

Ejecute el siguiente comando e intente de nuevo ejecutar el docker-compose: 
```
systemctl stop systemd-resolved
```
