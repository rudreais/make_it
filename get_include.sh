#!/bin/bash

includes=()
libname=("c_graph_prog" "m")
incname=("SFML" "math")

readarray file < "$1"

for i in "${file[@]}"
do
    is_line=$(echo $i | grep ^#include)
    if [ -n "$is_line" ]
    then
	include+=($i)
    fi
done

function has_lib {
    local index=0
    local has_include=$(echo "$1" | cut -c 11-15)
    echo $1
}

for i in "${include[@]}"
do
    has_lib $i
done

printf "${include[*]}\n"
