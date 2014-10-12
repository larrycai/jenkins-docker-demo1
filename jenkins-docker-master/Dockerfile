# docker build -t larrycai/jenkins-docker-master .

FROM ubuntu:14.04

MAINTAINER Larry Cai <larry.caiyu@gmail.com>

ENV REFRESHED_AT 2014-08-18

RUN apt-get update && apt-get install -y curl openjdk-6-jdk

RUN curl https://get.docker.io/builds/Linux/x86_64/docker-latest -o /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

# docker plugin 0.8 release needs 1.580+
#RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war/latest/jenkins.war

# ssh-slaves needs 1.6+, default in LTS is 1.5
RUN for plugin in durable-task docker-plugin ssh-slaves ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

# stick with 1.6 version
RUN touch $JENKINS_HOME/plugins/ssh-slaves.jpi.pinned

RUN ln -s $JENKINS_HOME/dockerjenkins.sh /usr/local/bin

WORKDIR /opt/jenkins/data
ADD JENKINS_HOME $JENKINS_HOME/

EXPOSE 8080

CMD [ "/opt/jenkins/data/dockerjenkins.sh" ]
