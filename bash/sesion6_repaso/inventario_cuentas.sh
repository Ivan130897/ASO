#!/bin/bash

rex1='/bin/bash$'
rex2='^(/[a-z]+)+$'
cuentas=0
uid1000=0

if [[ -z $1 ]]; then
	while IFS=':' read -r usuario x uid gid desc home shell; do
		if [[ $shell =~ $rex1 ]]; then
			echo $usuario:$uid:$home:$shell
			((cuentas++))
		elif [[ $uid -ge 1000 ]]; then
			((uid1000++))
		fi
	done < /etc/passwd
	echo "-----"
	echo "Cuentas listadas:" $cuentas
	echo "Con UID >= 1000:" $uid1000
	exit 0
fi
if ! [[ $1 =~ $rex2 ]]; then
	echo $1 "no es una ruta válida"
	exit 1
fi

if [[ $1 =~ $rex2 ]]; then
	while IFS=':' read -r usuario x uid gid desc home shell; do
                if [[ $shell =~ $1 ]]; then
                        echo $usuario:$uid:$home:$shell
                        ((cuentas++))
                elif [[ $uid -ge 1000 ]]; then
                        ((uid1000++))
                fi
        done < /etc/passwd
        echo "-----"
        echo "Cuentas listadas:" $cuentas
        echo "Con UID >= 1000:" $uid1000
        exit 0
fi
