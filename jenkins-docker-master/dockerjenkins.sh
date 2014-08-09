#!/bin/bash
export DOCKER_HOST=unix:///docker.sock
exec java -jar /opt/jenkins/jenkins.war
