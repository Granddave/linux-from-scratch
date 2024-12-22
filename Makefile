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

backup-sources:
	docker cp $(NAME):/mnt/lfs/sources/ .

backup-scripts:
	docker cp $(NAME):/mnt/lfs/scripts/ .

restore-sources:
	docker exec $(NAME) bash -c '/usr/bin/rm -rf /mnt/lfs/sources/*'
	find ./sources -mindepth 1 -maxdepth 1 -exec docker cp {} $(NAME):/mnt/lfs/sources/ \;

restore-scripts:
	docker exec $(NAME) bash -c '/usr/bin/rm -rf /mnt/lfs/scripts/*'
	find ./scripts -mindepth 1 -maxdepth 1 -exec docker cp {} $(NAME):/mnt/lfs/scripts/ \;

clean:
	docker rmi $(DOCKER_IMAGE)

.PHONY: all run build
