#include env_make
PORTS = -p 443:4200
VOLUMES = -v $(DIR)/nfs:/nfs 
ENV = 

NS = thomasbryan
VERSION ?= latest

REPO = dotfiles
NAME = dotfiles
INSTANCE = default

DIR := ${CURDIR}

.PHONY: default install build docker push bash shell run start stop rm release

install:
	/bin/bash ./install.sh

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

docker: build start

push:
	docker push $(NS)/$(REPO):$(VERSION)

bash:
	docker exec -i -t $(shell docker ps | grep $(NS)/$(REPO):$(VERSION)|awk '{print $$1}') /bin/bash

shell:
	docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION) /bin/bash

run:
	docker run --rm --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

release: build
	make push -e VERSION=$(VERSION)

default: install
