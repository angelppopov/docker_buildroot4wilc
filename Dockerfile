## Linux4SAM development environment based on Ubuntu 16.04 LTS.
## SOM-EK && WILC3000
## version 0.0.1 

## Derived from: 
## https://hub.docker.com/r/terrycmchan/buildrootdocker/~/dockerfile/

FROM ubuntu:16.04

LABEL maintainer="microchipfae@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

## First, install add-apt-repository and bzip2 

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# RUN apt-get update
# RUN apt-get install -y apt-utils

RUN apt-get install -y locales locales-all git 
RUN apt-get install -y subversion build-essential bison flex gettext
RUN apt-get install -y libncurses5-dev texinfo autoconf automake libtool mercurial git-core
RUN apt-get install -y gperf gawk expat curl cvs libexpat-dev bzr unzip bc python-dev
RUN apt-get install -y wget cpio

WORKDIR /home

RUN git clone https://github.com/LeoZhang-Atmel/buildroot-external-wilc.git

# Grab master branch.  "linux4sam_6_0" broke ...
# RUN git clone https://github.com/linux4sam/buildroot-at91.git -b linux4sam_6.0
RUN git clone https://github.com/linux4sam/buildroot-at91.git

## To change to another directory, use WORKDIR.  All RUN, CMD and ENTRYPOINT 
## commands after WORKDIR will be executed from the directory.

WORKDIR /home/buildroot-at91

RUN BR2_EXTERNAL=../buildroot-external-wilc/ make sama5d27_som1_ek_wilc_defconfig
RUN make

## Sometimes Buildroot need proper locale, e.g. when using a toolchain 
## based on glibc.

RUN locale-gen en_US.utf8



