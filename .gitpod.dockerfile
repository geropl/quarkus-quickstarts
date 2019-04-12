FROM gitpod/workspace-full

USER gitpod

ARG VERSION=1.0.0-rc15
ARG NAME=graalvm.tar.gz
ARG EDITION=graalvm-ce
ARG PACKAGE_NAME=${EDITION}-${VERSION}
RUN wget https://github.com/oracle/graal/releases/download/vm-${VERSION}/${PACKAGE_NAME}-linux-amd64.tar.gz -O $NAME \
    && tar -xf graalvm.tar.gz -C ~

ENV GRAALVM_HOME="~/$PACKAGE_NAME" \
    PATH="$GRAALVM_HOME/bin:$PATH"

USER root