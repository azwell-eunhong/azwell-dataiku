FROM dss-engine:v1

## DSS
## NODE_TYPE : api : api node
##           : automation : automation node
##           : design : design node

ARG DSS_VERSION=13.5.5
ARG NODE_TYPE=design
ENV DSS_VERSION=${DSS_VERSION}
ENV NODE_TYPE=${NODE_TYPE}
ENV DSS_HOME=/data/dss_data

USER root
COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

WORKDIR /data
USER dataiku
RUN echo "DSS_VERSION=${DSS_VERSION}" > config.env && \
    echo "NODE_TYPE=${NODE_TYPE}" >> config.env

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
