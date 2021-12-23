# With inspiration from https://github.com/nightscape/scala-mill
FROM centos:7

ENV SCALA_VERSION 2.13.6
ENV MILL_VERSION 0.9.11

SHELL ["/bin/bash", "-c"]

# Create non-root user:group and generate a home directory to support SSH
RUN adduser builduser \
    && passwd -d builduser \
    && echo "builduser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install build dependencies (Scala, Mill)
RUN yum update -y

RUN yum -y install java-1.8.0-openjdk && \
    yum -y clean all

RUN \
  curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
              echo >> /root/.bashrc && \
              echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc

RUN \
  curl -L -o /usr/local/bin/mill https://github.com/com-lihaoyi/mill/releases/download/$MILL_VERSION/$MILL_VERSION && \
    chmod +x /usr/local/bin/mill && \
    touch build.sc && \
    mill -i resolve _ && \
    rm build.sc

USER builduser

VOLUME /scripts
VOLUME /workdir

# run bash script and process the input command
ENTRYPOINT [ "/bin/bash", "/scripts/run_build.sh"]