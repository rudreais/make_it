##
## EPITECH PROJECT, 2017
## ok
## File description:
##	__DESCRIPTION__
##

RM	=	rm -f

SRC	=	my_printf.c		\
		my_put_base.c		\
		my_put_big_nbr.c	\
		my_putchar.c		\
		my_intlen.c		\
		my_put_nbr.c		\
		my_putstr.c		\
		my_strlen.c		\
		my_atoi.c		\
		get_next_line.c

OBJ	=	$(SRC:.c=.o)

CFLAGS	=	-g3 -W -Wall -Wextra -I .

EXEC	=	libmy.a

all:		$(EXEC)

$(EXEC):
		gcc -c $(SRC)
		ar rc $(EXEC) $(OBJ)

clean:
		$(RM) $(OBJ)

fclean:		clean
		$(RM) $(EXEC)

re:		fclean all

.PHONY:		all clean fclean re
