# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctirions <ctirions@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/25 14:35:38 by ctirions          #+#    #+#              #
#    Updated: 2021/08/25 14:51:07 by ctirions         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BLACK		= $(shell tput -Txterm setaf 0)
RED			= $(shell tput -Txterm setaf 1)
GREEN		= $(shell tput -Txterm setaf 2)
YELLOW		= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	= $(shell tput -Txterm setaf 4)
PURPLE		= $(shell tput -Txterm setaf 5)
BLUE		= $(shell tput -Txterm setaf 6)
WHITE		= $(shell tput -Txterm setaf 7)
RESET		= $(shell tput -Txterm sgr0)

SRCS_CLIENT	=	client.c \
SRCS_SERVER	=	server.c \

OBJS_CLIENT =	$(addprefix client_dir/, ${SRCS_CLIENT:.c=.o})
OBJS_SERVER	=	$(addprefix server_dir/, ${SRCS_SERVER:.c=.o})

NAME_CLIENT	=	client.a
NAME_SERVER	=	server.a

CFLAGS 		=	-Wall -Wextra -Werror
CC			=	gcc

.c.o:
				@${CC} ${CFLAGS} -c -I ./includes $< -o ${<:.c=.o}
				@echo "${LIGHTPURPLE}Compilation : $< --> .o${RESET}"

$(NAME_CLIENT):	${OBJS_CLIENT}
				@ar -rcs ${NAME_CLIENT} ${OBJS_CLIENT}
				@ranlib ${NAME_CLIENT}
				@${CC} ${CFLAGS} ${NAME_CLIENT}
				@mv a.out client