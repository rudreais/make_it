#!/bin/bash

include=()
libname=("c_graph_prog" "m")
incname=("SFML" "math")

readarray file < "$1"

for i in "${file[@]}"
do
    include+=("$i")
done

for i in "${include[@]}"
do
    if [ -n "$(echo $i | grep \^#include)" ]
    then
	printf "$i"
    fi
done
