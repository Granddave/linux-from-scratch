DOCKER_IMAGE=lfs
NAME=lfs
DOCKER_VOLUME=lfs_volume
VOLUME_ARGS=-v $(DOCKER_VOLUME):/mnt/lfs

all: build run

run:
	docker run --rm -it --privileged --name $(NAME) $(VOLUME_ARGS) $(DOCKER_IMAGE):latest || true

build:
	docker build -t $(DOCKER_IMAGE):latest .

attach:
	docker exec -it $(NAME) /bin/bash || true

backup-sources:
	docker cp $(NAME):/mnt/lfs/sources/ .

backup-scripts:
	docker cp $(NAME):/mnt/lfs/scripts/ .

restore-sources:
	docker exec $(NAME) bash -c 'rm -rf /mnt/lfs/sources/*'
	tar cf - sources | docker exec -i $(NAME) tar xf - -C /mnt/lfs/

restore-scripts:
	docker exec $(NAME) bash -c 'rm -rf /mnt/lfs/scripts/*'
	tar cf - scripts | docker exec -i $(NAME) tar xf - -C /mnt/lfs/

create-volume:
	docker volume create $(DOCKER_VOLUME)

clean:
	docker rmi $(DOCKER_IMAGE)
	docker volume rm $(DOCKER_VOLUME)

.PHONY: all run build clean attach backup-sources backup-scripts restore-sources restore-scripts
