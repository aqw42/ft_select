# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: conoel <conoelstudent.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/01/10 21:14:13 by conoel            #+#    #+#              #
#    Updated: 2019/05/05 17:42:49 by conoel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =			ft_select
AUTEUR =		"conoel"

SRC_NAME =		main.c\
				init.c\
				read_key.c\
				tab_utils.c\
				display.c\
				arrow_handlers.c\
				arrow_tests.c\
				special_handlers.c\
				special_tests.c\
				signal.c

SRC_DIR =		./src/
SRC =			${addprefix $(SRC_DIR), $(SRC_NAME)}

OBJ_NAME =		$(SRC_NAME:.c=.o)
OBJ_DIR =		./obj/
OBJ =			${addprefix $(OBJ_DIR), $(OBJ_NAME)}

HEADER_DIR =	./include/
HEADER_NAME =	ft_select.h\
HEADER =		${addprefix $(HEADER_DIR), $(HEADER_NAME)}

LIB_NAME =		haflib.a
LIB_DIR =		./libft/
LIB_HEADER =	./libft/includes/
LIB =			${addprefix $(LIB_DIR), $(LIB_NAME)}

FLAGS =			#-Wall -Werror -Wextra -g3
CC =			clang

#################################################################################
##################################### RULES #####################################
#################################################################################

.PHONY: all clean fclean re
.SILENT:

##############################
########## GENERALS ##########
##############################

all: ./auteur $(LIB) $(OBJ_DIR) $(NAME) $(HEADER)

re: fclean all

clean:
	rm -rf $(OBJ_DIR)
	make clean -C $(LIB_DIR)

fclean:
	make fclean -C $(LIB_DIR)
	rm -rf $(OBJ_DIR) $(NAME) *.dSYM
	echo "\033[31m\033[1m\033[4mCleaning\033[0m\033[31m : Everything\033[0m [$(NAME)]";

###############################
######### COMPILATION #########
###############################

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) $(LIB) -o $(NAME) -I$(HEADER_DIR) -I$(LIB_DIR) -ltermcap
	echo "\n \033[1m\033[4m\033[35m\\^/ Done compiling \\^/\033[0m [$(NAME)] --> $(LIB_NAME)"
	clear
	echo "#################################################################"
	echo "##\033[32m  ___   _____          ___   ___   _     ___    ___   _____  \033[0m##"
	echo "##\033[32m |  _| |_   _|       / ___| |  _| | |   |  _|  / __| |_   _| \033[0m##"
	echo "##\033[32m | |_    | |    __   \__  \ | |_  | |   | |_  | /      | |   \033[0m##"
	echo "##\033[32m |  _|   | |   |__|   __| | |  _| | |_  |  _| | \__    | |   \033[0m##"
	echo "##\033[32m |_|     |_|         /___/  |___| |___| |___|  \___|   |_|   \033[0m##"
	echo "##                                                             ##"
	echo "################################\033[32m CONOEL \033[0m#########################"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -I$(HEADER_DIR) -I$(LIB_HEADER)
	printf "\033[32m\033[1m\033[4mCompiling\033[0m\033[32m : %-30s \033[0m [$(NAME)]\n" $@


$(OBJ_DIR):
	clear
	mkdir $(OBJ_DIR)
	echo "\n>=========== * \033[32m\033[1mCreating $(NAME) obj dir\033[0m * ===========<";

./auteur:
	echo $(AUTEUR) > ./auteur
	echo "\033[32m<Created Author file>\033[0m"

###############################
############# LIB #############
###############################

$(LIB):
	make -C $(LIB_DIR)
