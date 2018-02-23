# make_it
automatic creation of makefile for C project

## how to install
just run the `install.sh` file as root as:
```
$ sudo ./install.sh
```
it will ask you for a bin directory.

the default one that'll be used is $HOME/bin (if not existing, will create it).

## how to use
[short video](https://asciinema.org/a/CVN6s2mctdpllF3DZfl1aTBjS)

```
$ make_it my_repo
// clears screen
```
once you launch it, it will ask you for a sources directory where all your .c are, a libraries directory where your subdirectories for lib are, and an include directory with all your .h.