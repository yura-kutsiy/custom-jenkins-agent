FROM jenkins/inbound-agent
USER root
RUN apt update -y
# install curl
RUN apt install curl -y
WORKDIR /bin/
# install popeye
RUN curl -L https://github.com/derailed/popeye/releases/download/v0.10.1/popeye_Linux_x86_64.tar.gz | tar zx ; rm LICENSE README.md ; chmod +x popeye ; chown jenkins popeye
# install trivy
RUN apt install trivy -y
# clean apt cache
RUN apt clean autoclean && apt autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]