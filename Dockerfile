FROM centos:latest
MAINTAINER lijiaocn <lijiaocn@foxmail.com>

WORKDIR   /root

RUN yum install -y openssh-clients

ADD ./entrypoint.sh  /root/

EXPOSE 1111

ENTRYPOINT ["bash", "/root/entrypoint.sh" ]

USER root

ENV ROOTPASS=dd13427
ENV SSHPROXYADDR=1.1.1.1
ENV SSHPROXYPORT=203
