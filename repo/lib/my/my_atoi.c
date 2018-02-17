/*
** EPITECH PROJECT, 2018
** foo
** File description:
** foo
*/

int is_num(char c)
{
	return ((c >= '0' && c <= '9') ? 1 : 0);
}

int my_atoi(char *str)
{
	int nbr = 0;
	int is_neg = 1;

	if (*str == ' ')
		while (*str == ' ')
			str++;
	while (*str) {
		if (*str == '-') {
			is_neg = -1;
			str++;
		}
		if (!(is_num(*str)) && *str != ' ')
			return ((nbr * is_neg) / 10);
		else if (*str == ' ')
			str++;
		nbr = ((*str - '0') + nbr);
		nbr = nbr * 10;
		str++;
	}
	return ((nbr * is_neg) / 10);
}
