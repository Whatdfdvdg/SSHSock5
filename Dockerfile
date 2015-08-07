FROM centos:latest
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y openssh-clients && yum install -y expect

ADD ./entrypoint.sh  /root/

EXPOSE 1111

ENTRYPOINT ["bash", "/root/entrypoint.sh" ]

USER root

ENV SSHPROXYPASS=dd13427
ENV SSHPROXYADDR=172.17.0.9
ENV SSHPROXYPORT=22
