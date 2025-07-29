FROM dataiku/dss:8.0.2 AS base

## DSS
## NODE_TYPE : api : api node
##           : automation : automation node
##           : design : design node
ARG DSS_VERSION=8.0.2
ARG NODE_TYPE=design

ENV NODE_TYPE=${NODE_TYPE}
ENV DSS_VERSION=${DSS_VERSION}
ENV DSS_HOME=/home/dataiku//dss
ENV DSS_INSTALLDIR=/home/dataiku/dataiku-dss-${DSS_VERSION}
ENV DSS_PORT=10000

USER root

RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak && \
    sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && \
    yum makecache

RUN yum install -y npm \
        gtk3 \
        libXScrnSaver && \
        yum clean all

COPY run.sh /

RUN chmod a+x /run.sh

USER dataiku
WORKDIR /home/dataiku
RUN rm -f /home/dataiku/run.sh

ENTRYPOINT ["/run.sh"]

CMD ["start"]
