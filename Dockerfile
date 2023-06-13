FROM ubuntu:jammy

RUN apt -y update && apt -y install nginx libnginx-mod-rtmp

EXPOSE 8080/tcp
EXPOSE 1935/tcp

RUN mkdir -p /mnt/records/nginx-rtmp-records/hls/

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
