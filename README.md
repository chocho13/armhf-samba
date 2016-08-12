* [`latest` is the latest packaged stable Linux Alpine package version (currently 4.4.5)](https://github.com/chocho13/armhf-samba/blob/master/Dockerfile)

[Docker](https://www.docker.com/) image for [samba](https://www.samba.org/) for armhf based on [troyfontaine/armhf-alpinelinux:3.4](https://hub.docker.com/r/troyfontaine/armhf-alpinelinux/)

### Usage

All mounts and ports are optional and samba will work even with only:

    $ docker run chocho13/armhf-samba

... however that way port used to connect to server is not exposed, and all settings as well as storage will be lost if the container is removed.

So let's create some directories :

    $ mkdir share config

... and start using this command:

    $ docker run -d \
        -p 445:445 \
        -v $PWD/config:/etc/samba \
        -v $PWD/share:/media/storage \
        chocho13/armhf-samba

... to have samaba server running default port 445 and sharing Storage on [smb://localhost/Storage](smb://localhost/Storage) (no user and password) with config in the following locations mounted:

* `/config`: samba configuration files
* `/share`: files

It is probably a good idea to add `--restart=always` so the container restarts if it goes down.

Note: For the container to run, the legal notice had to be automatically accepted. By running the container, you are accepting its terms. Toggle the flag in `qBittorrent.conf` to display the notice again.

Feedbacks

Having more issues? [Report a bug on GitHub.](https://github.com/chocho13/armhf-samba/issues)
