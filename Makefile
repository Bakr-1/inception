# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aalseri <aalseri@student.42Abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/23 13:05:43 by aalseri           #+#    #+#              #
#    Updated: 2023/02/25 13:35:39 by aalseri          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BLACK		:= $(shell tput -Txterm setaf 0)
RED		:= $(shell tput -Txterm setaf 1)
GREEN		:= $(shell tput -Txterm setaf 2)
YELLOW		:= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	:= $(shell tput -Txterm setaf 4)
PURPLE		:= $(shell tput -Txterm setaf 5)
BLUE		:= $(shell tput -Txterm setaf 6)
WHITE		:= $(shell tput -Txterm setaf 7)
RESET		:= $(shell tput -Txterm sgr0)

DOC-COM = ./srcs/docker-compose.yml
DOC-COM_BONUS = ./srcs/requirements/bonus/docker-compose.yml

all: run

run: 
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/$$USER/data/wordpress
	@sudo mkdir -p /home/$$USER/data/mariadb
	@echo "$(GREEN)Building containers ... $(RESET)"
	@docker compose -f $(DOC-COM) up --build

debug:
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/$$USER/data/wordpress
	@sudo mkdir -p /home/$$USER/data/mariadb
	@echo "$(GREEN)Building containers with log information ... $(RESET)"
	@docker compose -f $(DOC-COM_BONUS) --verbose up

list_volumes:
	@echo "$(PURPLE)Listing volumes ... $(RESET)"
	docker volume ls

bonus:
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/$$USER/data/wordpress
	@sudo mkdir -p /home/$$USER/data/mariadb
	@echo "$(GREEN)Building containers ... $(RESET)"
	@docker compose -f $(DOC-COM_BONUS) up --build

down:
	@docker compose -f ${DOC-COM} down

re:
	@sudo docker compose -f ${DOC-COM} up -d --build

git:
	git add -A
	git commit
	git push

clean: 	
	@echo "$(RED)Stopping containers ... $(RESET)"
	@docker compose -f $(DOC-COM) down
	@-docker stop `docker ps -qa`
	@-docker rm `docker ps -qa`
	@echo "$(RED)Deleting all images ... $(RESET)"
	@-docker rmi -f `docker images -qa`
	@echo "$(RED)Deleting all volumes ... $(RESET)"
	@-docker volume rm `docker volume ls -q`
	@echo "$(RED)Deleting all network ... $(RESET)"
	@-docker network rm `docker network ls -q`
	@echo "$(RED)Deleting all data ... $(RESET)"
	@sudo rm -rf /home/$$USER/data/wordpress
	@sudo rm -rf /home/$$USER/data/mariadb
	@echo "$(RED)Deleting all $(RESET)"
	@sudo docker system prune -f -a

.PHONY: all re run list_volumes debug down clean