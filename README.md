# docker-unturned

## Getting started

Although the image has not been published on dockerhub yet, you can download the repository and build proper docker image.

```sh
git clone --depth=1 https://github.com/mira-ta/docker-unturned.git docker-unturned

docker build docker-unturned
```

After that you can run the server to verify success using:

```sh
docker run --rm --interactive --tty docker-unturned /bin/bash -c 'ls -lAhs'
```

## Adding distribution folder

You would create your own dockerfile with distribution path (handy for developers) or docker volumes (handy for production).

```Dockerfile
FROM docker-unturned

COPY ./bin/Release/Plugin.dll ./Servers/Default/Rocket/Plugins
COPY ./bin/Release/SomeDependency.dll ./Servers/Default/Rocket/Libraries

# and e.t.c.
```

Or, maybe:

```sh
docker run --volume /var/server:/home/steamcmd/unturned/Servers/Default/:rw docker-unturned
```

