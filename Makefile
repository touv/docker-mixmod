NAME=mixmod

.PHONY: run

build: Dockerfile
	docker build -t ${NAME} \
		--build-arg http_proxy \
		--build-arg https_proxy \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=$(shell id -g) \
		.
