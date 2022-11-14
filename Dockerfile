FROM nginx:alpine

RUN apk update
RUN apk add wget bash perl
COPY web /var/www/ice-cores
COPY conf/ice-cores.conf /etc/nginx/conf.d/ice-cores.conf
RUN cd /var/www/ice-cores/data && \
    ./download.sh && \
    ./tidy.sh
