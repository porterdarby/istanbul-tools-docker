# istanbul-tools-docker

[![](https://images.microbadger.com/badges/version/porterdarby/istanbul-tools-docker.svg)](https://microbadger.com/images/porterdarby/istanbul-tools-docker "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/porterdarby/istanbul-tools-docker.svg)](https://microbadger.com/images/porterdarby/istanbul-tools-docker "Get your own image badge on microbadger.com")

A Dockerization of the `istanbul-tools` repository (hosted at https://github.com/getamis/istanbul-tools).

## Usage
The intent of this docker image is to facilitate the usage of istanbul-tools. To support this, the image has been designed to take in the same parameters that the istanbul-tools executable would take in. An example would be as so:

```
docker run --mount type=bind,src=`pwd`,dst=/workdir porterdarby/istanbul-tools-docker:latest \
setup --quorum --num 4 --nodes --verbose --save
```

The required elements are as follows:

* `docker run`: Exercise left to the reader
* ``--mount type=bind,src=`pwd`,dst=/workdir``: mounts the current directory into the `/workdir` directory in the container. This workdir directory will have all of the resulting files written back to the host computer in the current working directory. Adjust the `src` value as needed.
* `porterdarby/istanbul-tools-docker:latest`: Image name.
* `setup --quorum --num 4 --nodes -verbose --save`: The configuration of the application. See [istanbul-tools README](https://github.com/getamis/istanbul-tools/blob/master/README.md).

