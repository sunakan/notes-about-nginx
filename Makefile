ENV_TAG=develop
NGINX_VERSION_TAG=stable
CONTAINER_NAME=nginx

build:
	docker build -t suna-nginx:${ENV_TAG} --build-arg NGINX_VERSION_TAG=${NGINX_VERSION_TAG} .

run:
	docker run --rm -p 3000:80 --name ${CONTAINER_NAME} suna-nginx:${ENV_TAG}

bash:
	docker exec -it ${CONTAINER_NAME} bash
