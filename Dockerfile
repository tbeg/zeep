FROM phusion/baseimage
MAINTAINER Chilles

RUN apt-get update && apt-get -y install vim python-psycopg2 postgresql-server-dev-9.3 python-dev \
    binutils libproj-dev gdal-bin curl python-pip build-essential libssl-dev libffi-dev

RUN mkdir /zeep
WORKDIR /zeep
COPY requirements.txt /zeep/
RUN pip install -r requirements.txt

COPY database-check.py /zeep/

RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key

RUN mkdir -p /etc/my_init.d
COPY setup.sh /etc/my_init.d/setup.sh
RUN chmod +x /etc/my_init.d/setup.sh

RUN echo 'root:root' | chpasswd

EXPOSE 22 8000