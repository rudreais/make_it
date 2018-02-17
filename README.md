# make_it
automatic creation of makefile for C project

## how to use
in order to use make_it, your project must have a well built structure. see the tree below

```
rudreais@rudreais-ThinkPad-T470s:~/layout 0
$ tree
.
├── include
│   ├── my.h
├── lib
│   └── my
│       ├── get_next_line.c
│       ├── Makefile
│       ├── my_atoi.c
│       ├── my.h
│       ├── my_intlen.c
│       ├── my_printf.c
│       ├── my_put_base.c
│       ├── my_put_big_nbr.c
│       ├── my_putchar.c
│       ├── my_put_nbr.c
│       ├── my_putstr.c
│       └── my_strlen.c
├── Makefile
└── src
    └── main.c

4 directories, 16 files
```
this is just a project template, but it contains an include folder, a lib folder that itself contains a sub directory "my" that is a library, and a source folder containing all .c.
that way, make_it will look for each directory and create flags.
furthermore, make_it was built for EPITECH projects.
feel free to adapt make_it or your own architecture.