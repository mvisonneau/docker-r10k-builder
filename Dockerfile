# r10k-builder
# Author : Maxime VISONNEAU - @mvisonneau
#
# VERSION 0.1
# 
# BUILD : 	docker build -t <username>/r10k-builder:0.1 .
# RUN :		docker run --name r10k-builder <yourname>/r10k-builder:0.1
# 	

FROM ubuntu:latest
MAINTAINER Maxime VISONNEAU <maxime.visonneau@gmail.com>

# Installation & Configuration

RUN apt-get update && \
	apt-get install -y --force-yes git ruby1.9.1 ruby1.9.1-dev cmake pkg-config && \
	apt-get clean && \
	apt-get autoclean && \
	gem install bundler && \
	mkdir -p /shared/r10k/sources && \
	cd /shared/r10k/sources && \
	git clone git://github.com/puppetlabs/r10k . && \
	bundle install

# Expose and Startup
CMD ["/bin/bash"]