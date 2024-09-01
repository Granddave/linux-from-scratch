DOCKER_IMAGE=lfs
NAME=lfs

all: build run

run:
	docker run --rm -it --name $(NAME) $(DOCKER_IMAGE):latest || true

build:
	docker build -t $(DOCKER_IMAGE):latest .

attach:
	docker exec -it $(NAME) /bin/bash || true

cp-toolchain:
	docker cp $(NAME):/mnt/lfs/sources/ ./toolchain

clean:
	rm -rf build/*
	docker rmi $(DOCKER_IMAGE)

.PHONY: all run build
