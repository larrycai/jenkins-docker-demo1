## $ docker build -t larrycai/jenkins-slave-ubuntu .
FROM ubuntu:trusty

MAINTAINER Larry Cai <larry.caiyu@gmail.com>

ENV REFRESHED_AT 2014-08-18

# Make sure the package repository is up to date.
RUN apt-get update && apt-get install -y openssh-server \
    && apt-get install -y --no-install-recommends openjdk-7-jdk \
    && apt-get install -y curl

# install gcc/make design environment
RUN apt-get update && apt-get install -y unzip make gcc pkg-config libglib2.0-dev xz-utils
    
RUN mkdir -p /var/run/sshd

# Add user jenkins to the image
RUN adduser --quiet jenkins

# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

ENV HOME /home/jenkins

# private key
RUN mkdir $HOME/.ssh
RUN chown -R jenkins:jenkins $HOME/.ssh

ADD id_rsa.pub $HOME/.ssh/authorized_keys
RUN chown -R jenkins:jenkins $HOME/.ssh
RUN chmod 0700 $HOME/.ssh
RUN chmod 0660 $HOME/.ssh/authorized_keys

RUN curl -sf -o /tmp/out2html.zip -L https://github.com/larrycai/out2html/archive/master.zip


# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
