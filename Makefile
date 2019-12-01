ENV=develop
NGINX_VERSION_TAG=stable
CONTAINER_NAME=nginx
SECRET=DEVELOP_SECRET

build:
	bash ./build.sh

login:
	aws ecr get-login --no-include-email | sh

# 手動用
build-and-push: login
	bash ./build.sh | tail -1 | bash ./push-to-ecr.sh sunabako/suna-nginx

run:
	docker run --rm -p 3000:80 --name ${CONTAINER_NAME} -e ENV=${ENV} -e SECRET=${SECRET} sunakan/suna-nginx:latest

bash:
	docker exec -it ${CONTAINER_NAME} bash
