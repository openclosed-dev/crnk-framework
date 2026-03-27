FROM eclipse-temurin:8-jdk-noble

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME
ARG USER_UID
ARG USER_GID=$USER_UID

RUN userdel -r ubuntu \
  && groupadd -g ${USER_GID} ${USERNAME} \
  && useradd -u ${USER_UID} -g ${USER_GID} -m -s /bin/bash ${USERNAME}

RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install -y --no-install-recommends git openssh-client unzip

ARG GRADLE_VERSION

RUN curl -fsSLO "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
  && mkdir /opt/gradle \
  && unzip -d /opt/gradle gradle-${GRADLE_VERSION}-bin.zip

ARG MAVEN_VERSION

RUN curl -fsSLO "https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
  && mkdir /opt/maven \
  && tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/maven

ENV PATH=$PATH:/opt/gradle/gradle-${GRADLE_VERSION}/bin:/opt/maven/apache-maven-${MAVEN_VERSION}/bin

RUN mkdir /workspaces && chown ${USERNAME}:${USERNAME} /workspaces

USER ${USERNAME}

RUN mkdir -p /home/${USERNAME}/.gradle/caches \
  && mkdir -p /home/${USERNAME}/.m2/repository
