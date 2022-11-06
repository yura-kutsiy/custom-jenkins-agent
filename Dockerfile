FROM jenkins/inbound-agent
USER root
RUN apt update -y
# install curl
RUN apt install curl -y
## dir for app to be installed
WORKDIR /bin/
# install popeye
RUN curl -L https://github.com/derailed/popeye/releases/download/v0.10.1/popeye_Linux_x86_64.tar.gz | tar zx ; rm LICENSE README.md ; chmod +x popeye ; chown jenkins popeye
# install trivy
RUN curl -L https://github.com/aquasecurity/trivy/releases/download/v0.34.0/trivy_0.34.0_Linux-64bit.tar.gz | tar zx ; rm -rf LICENSE README.md contrib ; chown jenkins trivy
# clean apt cache
RUN apt clean autoclean && apt autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]