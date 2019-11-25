ARG NGINX_VERSION_TAG
FROM nginx:${NGINX_VERSION_TAG}

RUN apt-get update \
  && apt-get install -y vim tree

COPY ./*.html /usr/share/nginx/html/
COPY ./entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
