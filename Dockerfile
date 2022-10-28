FROM jenkins/inbound-agent
USER root
RUN apt update -y
RUN apt install curl -y
WORKDIR /bin/
RUN curl -L https://github.com/derailed/popeye/releases/download/v0.10.1/popeye_Linux_x86_64.tar.gz | tar zx && rm LICENSE README.md
RUN chmod +x popeye
RUN chown jenkins popeye
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]