#!/usr/bin/env bash
# docker-forestatrisk

# Base image
FROM rocker/rstudio:latest
MAINTAINER Ghislain Vieilledent <ghislain.vieilledent@cirad.fr>

# CRAN mirror
ENV CRAN_MIRROR https://ftp.igh.cnrs.fr/pub/CRAN/

# Install debian packages with apt-get
ADD apt-packages.txt /tmp/apt-packages.txt
RUN apt-get update --fix-missing \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && xargs -a /tmp/apt-packages.txt apt-get install -y

# Clean-up
RUN apt-get autoremove -y \
    && apt-get clean -y

# Install python packages with pip
ADD /requirements/ /tmp/requirements/
RUN pip3 install -r /tmp/requirements/pre-requirements.txt \
    && pip3 install -r /tmp/requirements/requirements.txt \
    && pip3 install --upgrade https://github.com/ghislainv/forestatrisk/archive/master.zip
#RUN pip3 install -r /tmp/requirements/additional-reqs.txt

# R packages (including reticulate)
RUN install2.r -e -s -r ${CRAN_MIRROR} \
                rmarkdown \
		knitr \
		kableExtra \
		caTools \
		bitops \
		leaflet \
		mapview \
		reticulate \
		glue \
		curl \
		dplyr \
		broom \
		ggplot2 \
		rasterVis \
		rgdal \
		coda \
		scales
		
# Run rocker/rstudio init
CMD ["/init"]

# End