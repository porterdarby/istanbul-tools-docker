# istanbul-tools-docker

A Dockerization of the `istanbul-tools` repository (hosted at https://github.com/getamis/istanbul-tools).

## Usage
To build the image, run `./build.sh`. This will tag the image as `istanbul-tools:latest`.

To run the image, run `docker run --name istanbul-tools -d istanbul-tools:latest`.

To log into the image, run `docker exec -it istanbul-tools /bin/bash`. Afterwards, all functionality should be accessible as explained in the [istanbul-tools README](https://github.com/getamis/itsanbul-tools/blob/master/README.md).
