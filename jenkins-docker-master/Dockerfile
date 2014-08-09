FROM ubuntu:14.04

MAINTAINER Larry Cai <larry.caiyu@gmail.com>
ENV REFRESHED_AT 2014-06-01

RUN apt-get update && apt-get install -y curl openjdk-6-jdk

RUN curl https://get.docker.io/builds/Linux/x86_64/docker-latest -o /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

RUN for plugin in docker-plugin ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

ADD ./dockerjenkins.sh /usr/local/bin/dockerjenkins.sh
RUN chmod +x /usr/local/bin/dockerjenkins.sh

ADD config.xml $JENKINS_HOME/
ADD credentials.xml $JENKINS_HOME/
RUN mkdir -p $JENKINS_HOME/jobs/docker-demo
ADD docker-demo.config.xml $JENKINS_HOME/jobs/docker-demo/config.xml

EXPOSE 8080

ENTRYPOINT [ "/usr/local/bin/dockerjenkins.sh" ]
