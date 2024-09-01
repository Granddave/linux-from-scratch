DOCKER_IMAGE=lfs
NAME=lfs

all: build run

run:
	docker run --rm -it --name $(NAME) $(DOCKER_IMAGE) || true

build:
	docker build -t $(DOCKER_IMAGE) .

attach:
	docker exec -it $(NAME) /bin/bash || true

clean:
	rm -rf build/*
	docker rmi $(DOCKER_IMAGE)

.PHONY: all run build
