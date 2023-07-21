FROM jenkins/jenkins:jdk11
USER root
RUN apt-get update -y && apt upgrade -y
RUN apt-get -y install openssh-client
RUN ssh-keygen -q -t rsa -N '' -f /id_rsa
