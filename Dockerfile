FROM ubuntu

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y libpcre3 libpcre3-dev \
    && apt install -y zlib1g-dev \
    && apt install -y openssl libssl-dev \
    && apt install -y gcc g++ automake make

COPY ./nginx-1.23.3.tar.gz /nginxcontainer/
COPY ./run.sh /nginxcontainer/

WORKDIR /nginxcontainer
RUN tar zxvf nginx-1.23.3.tar.gz
WORKDIR /nginxcontainer/nginx-1.23.3
RUN ./configure \
    && make -j32 \
    && make install

COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf

ENTRYPOINT ["bash", "/nginxcontainer/run.sh"]
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]