jenkins-docker-demo1
====================

jenkins demo 1 using jenkins docker plugin

    $ docker run -t -p 8080:8080 larrycai/jenkins-docker-demo1
    
The job `docker-demo` is created already, click to `build` directly

* it will pull `larrycai/jenkins-slave-ubuntu` for first time as slave docker container
* it will be launched to serve as slave machines
