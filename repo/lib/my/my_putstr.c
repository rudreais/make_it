/*
** EPITECH PROJECT, 2017
** putstr
** File description:
** putstr
*/

#include <unistd.h>
#include "my.h"

int my_putstr(char *str)
{
	write(1, str, my_strlen(str));
	return (0);
}
