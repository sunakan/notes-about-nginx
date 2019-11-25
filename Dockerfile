ARG NGINX_VERSION_TAG
FROM nginx:${NGINX_VERSION_TAG}

RUN apt-get update \
  && apt-get install -y vim tree

COPY index.html /usr/share/nginx/html/
