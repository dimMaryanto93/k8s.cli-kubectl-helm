FROM centos:centos7
LABEL org.label-schema.schema-version=1.21.0 maintaners="software.dimas_m@icloud.com"

ENV KUBECTL_VERSION=v1.21.0
ENV HELM_VERSION=v3.5.4

USER root
RUN yum install wget curl gettext -y

COPY kubectl .
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz && \
mv linux-amd64/helm /usr/local/bin/helm
