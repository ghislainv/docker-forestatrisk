Docker container to run the `forestatrisk` Python package.

The docker comes preinstalled with R, RStudio, reticulate, Python 3, GDAL, and key scientific Python and R packages to run the `forestatrisk` Python package in a R environment.

## Usage

* You can pull the container by running `docker pull ghislainv/docker-forestatrisk`.
* Execute `docker run -d  -e PASSWORD=yourpassword -p 8787:8787 -v /c/Users/foobar:/home/rstudio/foobar rocker/rstudio`
* Point your browser to `localhost:8787`. Log in with `rstudio/yourpassword` (please set your own password, it cannot be rstudio).

