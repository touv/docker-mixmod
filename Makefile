NAME=mixmod
PORT=3000

.PHONY: start stop

build: Dockerfile
	@docker build -t ${NAME}  --build-arg http_proxy --build-arg https_proxy .

run:
	@docker run -ti --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix ${NAME} mixmodGUI

