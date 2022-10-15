FROM jenkins/inbound-agent
USER root
RUN apt update -y
RUN apt install curl -y
RUN curl https://github.com/derailed/popeye/releases/download/v0.10.1/popeye_Linux_x86_64.tar.gz --output /bin/popeye
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]