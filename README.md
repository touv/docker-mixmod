# docker-mixmod

A docker image of [mixmod](http://www.mixmod.org/) software and a docker-compose file to run the image sharing X11 stuff to be able to display the Mixmod GUI on the host.

# Build and run

```sell
# to build the docker image
make build

# to run mixmod
docker-compose up
```

Notice: the image muse be built from the same unix user as the one that will execute mixmod.
