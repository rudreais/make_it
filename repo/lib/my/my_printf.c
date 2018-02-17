/*
** EPITECH PROJECT, 2017
** my_printf
** File description:
** my_printf
*/

#include <stdarg.h>
#include "my.h"

void my_parsing(char type, va_list ap)
{
	if (type == 'd' || type == 'i')
		my_put_nbr(va_arg(ap, int));
	else if (type == 'c')
		my_putchar((char) va_arg(ap, int));
	else if (type == 's' || type == 'S')
		my_putstr(va_arg(ap, char *));
	else if (type == 'o')
		my_put_base(va_arg(ap, int), 8);
	else if (type == '%')
		my_putchar('%');
	else if (type == 'u')
		my_put_big_nbr(va_arg(ap, unsigned int));
}

int my_printf(const char *format, ...)
{
	va_list ap;

	va_start(ap, format);
	while (*format) {
		if (*format == '%') {
		        format++;
			my_parsing(*format, ap);
			format++;
		} else
			my_putchar(*format++);
	}
	va_end(ap);
	return (0);
}
