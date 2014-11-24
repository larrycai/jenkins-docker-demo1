## $ docker build -t larrycai/jenkins-slave-centos .

FROM centos:centos6

MAINTAINER Larry Cai <larry.caiyu@gmail.com>

ENV REFRESHED_AT 2014-08-18

# Ensure we create the cluster with UTF-8 locale
RUN yum reinstall -y glibc-common
RUN localedef -i en_US -c -f UTF-8 en_US.UTF-8

RUN yum install -y openssh-server curl wget

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.rpm" -O jdk-7-linux-x64.rpm
RUN rpm -Uvh jdk-7-linux-x64.rpm
RUN rm jdk-7-linux-x64.rpm
ENV JAVA_HOME /usr/java/default

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key 

RUN mkdir -p /var/run/sshd

# Add user jenkins to the image & set passwd
RUN adduser -m jenkins
RUN echo "jenkins:jenkins" | chpasswd

ENV HOME /home/jenkins

# public key
RUN mkdir $HOME/.ssh
RUN chown -R jenkins:jenkins $HOME/.ssh

ADD id_rsa.pub $HOME/.ssh/authorized_keys
RUN chown -R jenkins:jenkins $HOME/.ssh
RUN chmod 0700 $HOME/.ssh
RUN chmod 0400 $HOME/.ssh/authorized_keys

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
