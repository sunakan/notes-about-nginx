ENV=develop
NGINX_VERSION_TAG=stable
CONTAINER_NAME=nginx
SECRET=DEVELOP_SECRET

build:
	docker build -t suna-nginx:${ENV} --build-arg NGINX_VERSION_TAG=${NGINX_VERSION_TAG} .

run:
	docker run --rm -p 3000:80 --name ${CONTAINER_NAME} -e ENV=${ENV} -e SECRET=${SECRET} suna-nginx:${ENV}

bash:
	docker exec -it ${CONTAINER_NAME} bash
