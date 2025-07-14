FROM almalinux/8-base AS base

## DSS
## NODE_TYPE : api : api node
##           : automation : automation node
##           : design : design node

ARG DSS_VERSION=13.5.5
ENV DSS_VERSION=${DSS_VERSION}
ENV DSS_HOME=/data/dss_data

RUN mkdir -p /data/dss_data && \
    useradd -u 5001 dataiku -s /bin/bash

RUN dnf install -y \
    acl \
    expat \
    git \
    nginx \
    unzip \
    zip \
    python3.9 \
    java-17-openjdk-headless.x86_64 \
    policycoreutils \
    policycoreutils-python-utils \
    wget \
    glibc-langpack-en \
    libgfortran \
    libgomp \
    liberation-fonts \
    xorg-x11-fonts-100dpi \
    xorg-x11-fonts-75dpi \
    xorg-x11-fonts-Type1 \
    xorg-x11-utils \
    xorg-x11-fonts-cyrillic \
    xorg-x11-server-Xvfb \
    npm \
    gtk3 \
    libXScrnSaver \
    mesa-libgbm \
    libX11-xcb \
    tar && \
    dnf clean all


#COPY entrypoint.sh /entrypoint.sh
#RUN chmod a+x /entrypoint.sh    

RUN chown -R dataiku:dataiku /data
WORKDIR /data
USER dataiku

RUN wget https://downloads.dataiku.com/public/dss/${DSS_VERSION}/dataiku-dss-${DSS_VERSION}.tar.gz && \
    wget https://downloads.dataiku.com/public/dss/${DSS_VERSION}/dataiku-dss-${DSS_VERSION}-sha256sums.txt && \
    sha256sum -c dataiku-dss-${DSS_VERSION}-sha256sums.txt 2>&1 | grep "OK" && \
    tar xzf dataiku-dss-${DSS_VERSION}.tar.gz && \
    rm -f dataiku-dss-${DSS_VERSION}.tar.gz dataiku-dss-${DSS_VERSION}-sha256sums.txt

ENV PATH="/usr/bin:$PATH"
ENV PYTHON_BIN=python3.9

#FROM base AS dss
#RUN ./dataiku-dss-${DSS_VERSION}/installer.sh -t design -d ${DSS_HOME} -p 11000 

#FROM base AS api
#RUN ./dataiku-dss-${DSS_VERSION}/installer.sh -t api -d ${DSS_HOME} -p 11000 

#FROM base AS automation
#RUN ./dataiku-dss-${DSS_VERSION}/installer.sh -t automation -d ${DSS_HOME} -p 11000 

#ENTRYPOINT ["/entrypoint.sh"]

