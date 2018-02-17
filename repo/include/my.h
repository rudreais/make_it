/*
** EPITECH PROJECT, 2017
** my.h
** File description:
** my.h
*/

#ifndef MY_H
#define MY_H

#define HIGHEST(a, b) (a <= b) ? b : a

int my_getnbr(char const *str);
int my_strlen(char *str);
void my_putchar(char c);
int my_putstr(char *str);
int my_put_nbr(int nb);
int my_put_big_nbr(unsigned int nb);
int my_put_base(int nb, int base);
int my_printf(const char *format, ...);
int is_num(char c);
int my_atoi(char *str);
char *get_next_line(int fd);

#endif
