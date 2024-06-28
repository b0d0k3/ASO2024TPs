#!/bin/bash

function determinar_ganador {
    if [[ "$1" == "$2" ]]; then
        texto="¡Es un empate!"
        echo $texto
    elif [[ ("$1" == "piedra" && "$2" == "tijeras") || 
            ("$1" == "papel" && "$2" == "piedra") || 
            ("$1" == "tijeras" && "$2" == "papel") ]]; then
        texto="¡Ganaste!"
        echo $texto
    else
        texto="¡Perdiste!"
        echo $texto
    fi
}

texto="Elige piedra, papel o tijeras:"
echo $texto
read usuario_eleccion


if [[ "$usuario_eleccion" != "piedra" && "$usuario_eleccion" != "papel" && "$usuario_eleccion" != "tijeras" ]]; then
    texto="Elección inválida. Por favor elige piedra, papel o tijeras."
    echo $texto
    exit 1
fi

opciones=("piedra" "papel" "tijeras")
computadora_eleccion=${opciones[$RANDOM % 3]}

texto="Tú elegiste: $usuario_eleccion"
echo $texto
texto="La computadora eligió: $computadora_eleccion"
echo $texto

determinar_ganador $usuario_eleccion $computadora_eleccion

