FROM alpine:latest
LABEL maintainer="JKS"

ENV PATH_SOURCE source
ENV PATH_BUILD build

RUN apk add python3

RUN pip3 install sphinx sphinx-autobuild

RUN mkdir /home/$PATH_SOURCE
RUN mkdir /home/$PATH_BUILD

VOLUME /home

RUN sphinx-autobuild /home/$PATH_SOURCE /home/$PATH_BUILD -H 0.0.0.0 --poll 
EXPOSE 8000
