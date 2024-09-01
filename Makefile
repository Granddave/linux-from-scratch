DOCKER_IMAGE=lfs
NAME=lfs
VOLUMES=-v lfs_volume:/mnt/lfs

all: build run

run:
	docker run --rm -it --name $(NAME) $(VOLUMES) $(DOCKER_IMAGE):latest || true

build:
	docker build -t $(DOCKER_IMAGE):latest .

attach:
	docker exec -it $(NAME) /bin/bash || true

cp-toolchain:
	docker cp $(NAME):/mnt/lfs/sources/ ./toolchain

clean:
	docker rmi $(DOCKER_IMAGE)

.PHONY: all run build
