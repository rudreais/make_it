#!/bin/bash

### CONSTANT
make_it="\e[1mmake_it\e[0m"
default_dir="$HOME/bin"
src_dir="src/"
src_content=("make_it.sh" "test.sh")

### RETURN VALUE
# 1 = NOT ROOT

if [ "$(whoami)" != "root" ]
then
    printf "You must be root to execute this script.\n"
    exit 1
fi

clear
printf "Please enter a binary directory to install $make_it.\nbin directory > "
read bin_repo

if [ -z "$bin_repo" ]
then
    printf "You didn't specify any directory.\n"
    printf "\e[1m$HOME/bin\e[0m is going to be created and used for the installation.\n"
    if [ ! -d "$default_dir" ] && [ -z "$bin_repo" ]
    then
	printf "$default_dir doesn't exist... Creating it.\n"
	mkdir "$HOME/bin"
    else
	printf "Found an existing directory at \e[1m$default_dir\e[0m. Using it.\n"
	bin_repo="$default_dir"
    fi
fi

if [ ! -d "$bin_repo" ]
then
    printf "\e[1m$bin_repo\e[0m doesn't exist. using default repository.\n"
    bin_repo="$default_dir"
fi

cp $src_dir${src_content[0]} $bin_repo
mv "$bin_repo/make_it.sh" "$bin_repo/make_it"

printf "Now adding \e[1m$bin_repo\e[0m to your PATH.\n"
if [ -z $(echo $PATH | grep $bin_repo) ]
then
    echo "export PATH=$PATH:$bin_repo" >> "$HOME/.bashrc"
fi
source "$HOME/.bashrc"
