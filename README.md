Docker container to run the `forestatrisk` Python package.

The docker comes preinstalled with R, RStudio, reticulate, Python 3, GDAL, and key scientific Python and R packages to run the `forestatrisk` Python package in a R environment.

## Usage

* You can pull the container by running `docker pull ghislainv/docker-forestatrisk`.
* Execute `docker run -d -e PASSWORD=PWD -p 8787:8787 -v ORIGIN_FOLDER:/home/rstudio ghislainv/docker-forestatrisk`. Set your own password `PWD`, it cannot be `rstudio`.
    * Replace `ORIGIN_FOLDER` with a folder on your local machine that you want to persist R scripts in. For example `/c/Users/YOUR_NAME` or `/home/YOUR_NAME`.
* Point your browser to `localhost:8787`. Log in with `rstudio/PWD`.

