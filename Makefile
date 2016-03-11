NAME=mixmod
PORT=3000

.PHONY: start stop

build: Dockerfile
	docker build -t ${NAME} \
		--build-arg http_proxy \
		--build-arg https_proxy \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=$(shell id -g) \
		.

run:
	docker run  -d -v `pwd`/data:/data ${NAME}

start:
	docker run -p ${PORT}:3000 -d -v `pwd`/data:/data ${NAME}

stop:
	DID=`docker ps | grep ${NAME} | awk '{print $$1}'` && docker stop $$DID
