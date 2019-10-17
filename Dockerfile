FROM nginx

RUN apt-get update
RUN apt-get install -y wget
COPY web /var/www/ice-cores
COPY conf/ice-cores.conf /etc/nginx/conf.d/ice-cores.conf
RUN cd /var/www/ice-cores/data && \
    ./download.sh && \
    ./tidy.sh
