jenkins-docker-demo1
====================

jenkins demo 1 using jenkins docker plugin

    $ docker run -t -p 8080:8080 larrycai/jenkins-docker-demo1
    
The job `docker-demo` is created already, click to `build` directly

* it will pull `larrycai/jenkins-slave-ubuntu` for first time as slave docker container
* it will be launched to serve as slave machines


Running under CoreOS
====================

Following https://coreos.com/docs/launching-containers/building/customizing-docker/ to enable the REMOTE API for docker

In short, to enable the socket, please put the file `docker-tcp.socket` into `/etc/systemd/system` and run following command to enable it.

    systemctl enable docker-tcp.socket
    systemctl stop docker
    systemctl start docker-tcp.socket
    systemctl start docker


