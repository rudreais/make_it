/*
** EPITECH PROJECT, 2017
** put_base
** File description:
** put_base
*/

#include "my.h"

int my_put_base(int nb, int base)
{
	if (nb > 0) {
		my_put_base(nb / base, base);
		my_putchar((nb % base) + '0');
	}
	return (0);
}
