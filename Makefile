ENV_TAG=develop
NGINX_VERSION_TAG=stable
build:
	docker build -t suna-nginx:${ENV_TAG} --build-arg NGINX_VERSION_TAG=${NGINX_VERSION_TAG} .

run:
	docker run -p 3000:80 suna-nginx:${ENV_TAG}
