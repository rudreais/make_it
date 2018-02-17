#!/bin/bash

## USAGE
if [ "$1" == "-h" ]
then
    printf "Usage:\n\t./make_it.sh [binary name]\n"
    printf "\tmake_it generates a makefile with basic rules: all, clean, fclean and re\n"
    printf "\tSee https://github.com/rudreais/make_it for sources and usage\n"
    exit
fi

clear

# constant string
## TODO: automatic year
header="##\n## EPITECH PROJECT, 2017\n## makefile\n## File description\n## makefile\n##"
exit_msg="Exiting make_it now..."
bold_green="\e[1m\e[32m"
end_char="\e[0m"

## VARIABLES
dirlib=()
dirlib_content=()
include=()
cflags=()
ldflags=()
dirsrc=()
src_list=()
src=()

### RETURN VALUE
# 1 = at least one directory from user input not found
# 2 = sources not found

## SOME USEFUL FUNCTIONS
function get_size_arr {
    arr=("$@")
    local index=0
    for i in ${arr[@]}
    do
	index=$(echo $index + 1 | bc)
    done
    echo $index
}

## GET USER INPUT AND CHECK IT
function user_input {
    printf "\e[1mSources\e[0m directory name\n> "
    read dirsrc
    printf "\e[1mLibraries\e[0m directory name\n> "
    read dirlib
    printf "Your \e[1minclude\e[0m directory name\n> "
    read include
}

function check_user_input {
    if [ ! -d "$dirsrc" ] || [ ! -d "$dirlib" ] || [ ! -d "$include" ]
    then
	printf "None of your directory exists\n"
	printf "Cannot access \e[1m$dirsrc\e[0m src directory\n"
	printf "Cannot access \e[1m$dirlib\e[0m lib directory\n"
	printf "Cannot access \e[1m$include\e[0m include directory\n"
	printf "\e[1m\e[31m$exit_msg\e[0m\n"
	exit 1
    elif [ ! -d "$dirsrc" ]
    then
	 printf "Your source directory does not exist\n"
	 printf "Cannot access \e[1m$dirsrc\e[0m src directory\n"
	 printf "\e[1m\e[31m$exit_msg\e[0m\n"
	 exit 1
    elif [ ! -d "$dirlib" ]
    then
	 printf "Your library directory does not exist\n"
	 printf "Cannot access \e[1m$dirlib\e[0m lib directory\n"
	 printf "\e[1m\e[31m$exit_msg\e[0m\n"
	 exit 1
    elif [ ! -d "$include" ]
    then
	 printf "Your include directory does not exist\n"
	 printf "Cannot access \e[1m$include\e[0m include directory\n"
	 printf "\e[1m\e[31m$exit_msg\e[0m\n"
	 exit 1
    fi
}

##BUILDING SOURCES
function build_src {
    content=$(ls $dirsrc | grep "\.c$")
    if [ -z "$content" ]
    then
        printf "\nNot any \e[1m\".c\"\e[0m found.\n"
        printf "Your \".c\" must be in the directory, not in a sub directory.\n"
        printf "\e[1m\e[31m$exit_msg\e[0m\n"
	exit 2
    else
	printf "Found \e[1m\e[32m$dirsrc\e[0m ! Now adding sources\n\n"
    fi
    src_list=($(ls "$dirsrc/" | grep "\.c$"))
    for i in ${src_list[@]}
    do
	printf "Sources $bold_green$i$end_char found. Adding it.\n"
	src+=("$dirsrc/$i")
    done
}

## BUILDING LIBRARIES
function build_lib {
    dirlib_content+=($(ls $dirlib))
    dirlib_nb=$(ls $dirlib | wc -w)
    add="no"
    index=0
    if [ -z "$dirlib_content" ]
    then
	printf "\nThis directory is empty. Leaving flags as they are.\n"
    else
	printf "\nFound $bold_green%s$end_char directory/ies !\n" $dirlib_nb
	for i in ${dirlib_content[@]}
	do
	    printf "Do you want to add \e[1m$i\e[0m ? (Y/n)> "
	    read add
	    if [ "$add" == "yes" ] || [ "$add" == "y" ] || [ -z "$add" ]
	    then
		printf "Adding $bold_green$i$end_char to the libraries.\n"
		ldflags+=("-L$dirlib/$i -l$i")
	    else
		printf "Skipping \e[1m$i\e[0m\n"
		unset dirlib_content[$index]
	    fi
	    index=$(echo $index + 1 | bc)
	done
    fi
}

## ADDING CFLAGS
function add_cflags {
    cflags+=("-W -Wall -Wextra -g ")
    cflags+="-I $include"
}

# cflags ldflags dirlib dir rm src obj exec all $(exec) clean fclean re phony

## ADDING TO MAKEFILE
function add_makefile {
    index=1
    max_index=0
    printf "Adding \e[1mEPITECH header\e[0m\n\n"
    printf "$header\n\n" > Makefile

    printf "Adding \e[1mC flags\e[0m\n"
    printf "CFLAGS = ${cflags[*]}\n\n"
    printf "CFLAGS\t\t+=\t${cflags[*]}\n\n" >> Makefile

    printf "Adding \e[1mlibraries flags\e[0m\n"
    printf "LDFLAGS = ${ldflags[*]}\n\n"
    max_index=$(get_size_arr ${ldflags[@]})
    for i in ${ldflags[@]}
    do
	if [ "$index" -eq 1 ]
	then
	    printf "LDFLAGS\t+=\t$i\t\\" >> Makefile
	    printf "\n" >> Makefile
	elif [ "$index" -eq "$max_index" ]
	then
	    printf "\t\t\t$i\n\n" >> Makefile
	else
	    printf "\t\t\t$i\t\\" >> Makefile
	    printf "\n" >> Makefile
	fi
	index=$(echo $index + 1 | bc)
    done
    index=1

    printf "Adding \e[1mlibraries directory\e[0m\n"
    for i in ${dirlib_content[@]}
    do
	printf "DIRLIB\t\t=\t${dirlib[*]}/$i\n\n" >> Makefile
	printf "DIRLIB = ./${dirlib[*]}/$i\n"
    done
    printf "\n"

    printf "Adding \e[1msources directory\e[0m\n"
    printf "DIR = ${dirsrc[*]}\n\n"
    printf "DIR\t\t=\t./${dirsrc[*]}\n\n" >> Makefile

    printf "Adding \e[1msources\e[0m\n"
    printf "SRC = ${src[*]}\n\n"
    max_index=$(get_size_arr ${src[@]})
    for i in ${src[@]}
    do
	if [ "$index" -eq 1 ]
	then
	    printf "SRC\t\t=\t$i" >> Makefile
	    if [ "$index" -ne "$max_index" ]
	    then
	       printf "\t\t\\" >> Makefile
	    fi
	    printf "\n" >> Makefile
	elif [ "$index" -eq "$max_index" ]
	then
	    printf "\t\t\t$i \n\n" >> Makefile
	else
	    printf "\t\t\t$i\t\t\\" >> Makefile
	    printf "\n" >> Makefile
	fi
	index=$(echo $index + 1 | bc)
    done
    index=1

    printf "Adding \e[1mbinary name\e[0m\n"
    printf "EXEC\t\t=\t$1\n\n" >> Makefile
    printf "EXEC = $1\n\n"

    printf "OBJ\t\t=\t\$(SRC:.c=.o)\n\n" >> Makefile

    printf "Adding \e[1m\"all\" rule\e[0m\n"
    printf "all:\$(EXEC)\n\n"
    printf "all:\t\t\t\$(EXEC)\n\n" >> Makefile

    printf "Adding \e[1m\"\$(EXEC)\" rule\e[0m\n"
    printf "\$(EXEC):\t\t\$(OBJ)\n" >> Makefile
    printf "\t\t\tmake -C \$(DIRLIB)\n" >> Makefile
    printf "\t\t\t\$(CC) -o \$(EXEC) \$(OBJ) \$(LDFLAGS) \$(CFLAGS)\n\n" >> Makefile
    printf "\$(EXEC):\$(OBJ)\n"
    printf "make -C \$(DIRLIB)\n"
    printf "\$(CC) -o \$(EXEC) \$(OBJ) \$(LDFLAGS) \$(CFLAGS)\n\n"

    printf "Adding \e[1m\"clean\" rule\e[0m\n"
    printf "clean:\n" >> Makefile
    printf "\t\t\tmake -C \$(DIRLIB) clean\n" >> Makefile
    printf "\t\t\trm -f \$(OBJ)\n\n" >> Makefile
    printf "clean:\n"
    printf "make -C \$(DIRLIB) clean\n"
    printf "rm -f \$(OBJ)\n\n"

    printf "Adding \e[1m\"fclean\" rule\e[0m\n"
    printf "fclean:clean\n" >> Makefile
    printf "\t\t\tmake -C \$(DIRLIB) fclean\n" >> Makefile
    printf "\t\t\trm -f \$(EXEC)\n\n" >> Makefile
    printf "fclean:clean\n"
    printf "make -C \$(DIRLIB) fclean\n"
    printf "rm -f \$(EXEC)\n\n"

    printf "Adding \e[1m\"re\" rule\e[0m\n"
    printf "re:\t\t\tfclean all\n\n" >> Makefile
    printf "re:fclean all\n\n"

    printf $bold_green"Makefile generated well!$end_char\n"
    printf "Now exiting make_it...\n"
    exit 0
}

function main {
    user_input
    check_user_input
    add_cflags
    printf "\n"
    build_src
    printf "\n"
    build_lib
    printf "\n"
    add_makefile $1
}

binary_name=""

if [ -z "$1" ]
then
    binary_name="to_change"
else
    binary_name=$1
fi

main $binary_name
