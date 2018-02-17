##
## EPITECH PROJECT, 2017
## ok
## File description:
##	__DESCRIPTION__
##

CFLAGS		+=	-I include -W -Wall -Wextra -g

LDFLAGS	+=	-L ./lib/my -l my

DIRLIB	=	./lib/my

DIR	=	./src

RM	=	rm -f

SRC	=	./src/main.c

OBJ	=	$(SRC:.c=.o)

EXEC	=	to_change

all:		$(EXEC)

$(EXEC):	$(OBJ)
		make -C $(DIRLIB)
		$(CC) -o $(EXEC) $(OBJ) $(LDFLAGS) $(CFLAGS)

clean:
		make -C $(DIRLIB) clean
		$(RM) $(OBJ)

fclean:	clean
		make -C $(DIRLIB) fclean
		$(RM) $(EXEC) val

re:		fclean all

.PHONY:	all clean re fclean
