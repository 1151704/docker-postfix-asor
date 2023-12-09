# Docker Postfix ASOR

El siguiente contenedor configura un servidor de correos con postfix.

## Instalar 

```
chmod +x install-docker.sh
./install-docker.sh
apt install docker-compose 
```

### Configure los nameserver
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

### Configure los DNS del host
En Windows debe configurar el protocoto (TCP/IPv4)
<div style="text-align:center">
![TCP/IPv4](https://github.com/1151704/docker-postfix-asor/blob/main/img/dns_windows.png?raw=true)
</div>


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
