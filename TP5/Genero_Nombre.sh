#!/bin/bash

texto="Ingresa un nombre:"
echo $texto
read nombre

respuesta=$(curl -s "https://api.genderize.io/?name=${nombre}")

genero=$(echo $respuesta | grep -o '"gender":"[^"]*' | grep -o '[^"]*$')

if [[ -z "$genero" ]]; then
    texto="No se pudo determinar el género para el nombre $nombre."
    echo $texto
else
    texto="El género para el nombre $nombre es: $genero."
    echo $texto
fi

