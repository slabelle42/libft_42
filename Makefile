NAME = libft.a

FLAG = -Wall -Wextra -Werror

HDR = libft.h
HDR_B = libft_bonus.h

EXE = libft
MAIN = main_libft.c

########################## [ SRC ] #########################
# ( int )
SRC =	ft_atoi.c
SRC +=	ft_itoa.c
# ( char )
SRC +=	ft_isalnum.c
SRC +=	ft_isalpha.c
SRC +=	ft_isascii.c
SRC +=	ft_isdigit.c
SRC +=	ft_isprint.c
SRC +=	ft_tolower.c
SRC +=	ft_toupper.c
# ( str )
SRC +=	ft_split.c
SRC +=	ft_strchr.c
SRC +=	ft_strdup.c
SRC +=	ft_strjoin.c
SRC +=	ft_strlcat.c
SRC +=	ft_strlcpy.c
SRC +=	ft_strlen.c
SRC +=	ft_strmapi.c
SRC +=	ft_strncmp.c
SRC +=	ft_strnstr.c
SRC +=	ft_strrchr.c
SRC +=	ft_strtrim.c
SRC +=	ft_substr.c
# ( mem )
SRC +=	ft_bzero.c
SRC +=	ft_calloc.c
SRC +=	ft_memccpy.c
SRC +=	ft_memchr.c
SRC +=	ft_memcmp.c
SRC +=	ft_memcpy.c
SRC +=	ft_memmove.c
SRC +=	ft_memset.c
# ( put )
SRC +=	ft_putchar_fd.c
SRC +=	ft_putendl_fd.c
SRC +=	ft_putnbr_fd.c
SRC +=	ft_putstr_fd.c
# ( lst )
SRC_B =		ft_lstadd_back_bonus.c
SRC_B +=	ft_lstadd_front_bonus.c
SRC_B +=	ft_lstclear_bonus.c
SRC_B +=	ft_lstdelone_bonus.c
SRC_B +=	ft_lstiter_bonus.c
SRC_B +=	ft_lstlast_bonus.c
SRC_B +=	ft_lstmap_bonus.c
SRC_B +=	ft_lstnew_bonus.c
SRC_B +=	ft_lstsize_bonus.c

########################## [ OBJ ] #########################
OBJ_DIR =		obj/
# ( basics )
OBJ_NAME =		$(SRC:.c=.o)
OBJ =			$(addprefix $(OBJ_DIR), $(OBJ_NAME))
# ( bonus )
OBJ_NAME_B =	$(SRC_B:.c=.o)
OBJ_B =			$(addprefix $(OBJ_DIR), $(OBJ_NAME_B))

############################################################

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $@ $?
	@ranlib $@
	@echo "Indexing ... OK"

$(OBJ): | $(OBJ_DIR)

$(OBJ_DIR):
	@mkdir $@
	@echo "Creating obj/ directory ... OK"

$(OBJ_DIR)%.o: %.c $(HDR)
	@gcc $(FLAG) -I $(HDR) -o $@ -c $?
	@echo "Compiling" [$?]  "... OK"

bonus: $(OBJ) $(OBJ_B)
	@ar rc $@ $?
	@ranlib $@
	@echo "Indexing ... OK"

$(OBJ_B): | $(OBJ_DIR)

clean:
	@rm -rf $(OBJ_DIR)
	@echo "Cleaning ... OK"

fclean: clean
	@rm -f $(NAME)
	@rm -f $(EXE)

exe: $(NAME)
	@gcc -o $(EXE) $(MAIN) -L. -lft
	@echo "Creating executable ... OK"

re: fclean all

.PHONY: all bonus clean fclean exe re
