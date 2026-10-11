#!/bin/bash

carpeta=$1
ext=$2

contar_por_extension() {
	for i in $carpeta; do
		find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l
	done
}

contar_por_extension
