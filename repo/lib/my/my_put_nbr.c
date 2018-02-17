/*
** EPITECH PROJECT, 2017
** put_nbr
** File description:
** put_nbr
*/

#include "my.h"

int my_put_nbr(int nb)
{
	if (nb < 0) {
		nb = nb * (-1);
		my_putchar('-');
	}
	if (nb > 0) {
		my_put_nbr(nb / 10);
		my_putchar((nb % 10) + '0');
	}
	return (0);
}
