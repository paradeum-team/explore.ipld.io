ARG VERSION=latest
FROM node:11 as builder

ENV NODE_OPTIONS="--max-old-space-size=4096"

COPY . /source/
RUN cd /source/ && \
  rm -rf build && \
  npm install && \
  npm start

#FROM nginx:stable-alpine as prod
#ARG VERSION
#RUN echo $VERSION > /version

#COPY --from=0 source/build/ /usr/share/nginx/html/

#COPY --from=0 source/entrypoint.sh /

#RUN chmod 755 /entrypoint.sh

EXPOSE 3000
#CMD ["/entrypoint.sh"]
