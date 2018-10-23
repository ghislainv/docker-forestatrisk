#!/usr/bin/env bash
# docker-forestatrisk

# Base image
FROM rocker/rstudio:latest
MAINTAINER Ghislain Vieilledent <ghislain.vieilledent@cirad.fr>

# CRAN mirror
ENV CRAN_MIRROR http://cran.mirror.ac.za/

# Terminal
ENV TERM=xterm
ENV LC_ALL C.UTF-8

# Install debian packages with apt-get
ADD apt-packages.txt /tmp/apt-packages.txt
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && xargs -a /tmp/apt-packages.txt apt-get install -y

# Clean-up
RUN apt-get autoremove -y \
    && apt-get clean -y

# Install python packages with pip
ADD /requirements/ /tmp/requirements/
RUN pip install --upgrade pip \
    && pip install -r /tmp/requirements/pre-requirements.txt \
    && pip install -r /tmp/requirements/requirements.txt \
    && pip install --upgrade https://github.com/ghislainv/forestatrisk/archive/master.zip
#RUN pip install -r /tmp/requirements/additional-reqs.txt

# R packages (including reticulate)
RUN install2.r --repos ${CRAN_MIRROR} \
		knitr \
		reticulate \
		glue \
		curl \
		dplyr \
		broom \
		ggplot2 \
		rasterVis \
		rgdal \
		coda \
		scales \
		grid

# Run rocker/rstudio init
CMD ["/init"]

# End