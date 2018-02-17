/*
** EPITECH PROJECT, 2018
** intlen
** File description:
** intlen
*/

int my_intlen(int nb)
{
        int length = 0;

        if (nb < 0)
                nb = nb * (-1);
        for (; nb > 0; length++)
                nb = nb / 10;
        return (length);
}