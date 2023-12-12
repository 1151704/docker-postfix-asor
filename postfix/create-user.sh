#!/bin/bash
if [ "$#" -lt 2 ]; then
    echo "Uso: $0 nameuser password"
    exit 1
fi
username=$1
pass=$2
adduser --disabled-password --gecos "" "$username" && echo "$username:$pass" | chpasswd
echo "Usuario: $1 registrado correctamente!."
