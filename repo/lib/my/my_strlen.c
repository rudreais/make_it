/*
** EPITECH PROJECT, 2017
** strlen
** File description:
** strlen
*/

#include "my.h"

int my_strlen(char *str)
{
	int length = 0;

	while (str[++length]);
	return (length);
}
