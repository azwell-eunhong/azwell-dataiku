#!/bin/bash
set -e
echo "Starting Dataiku DSS entrypoint script..."


source config.env
echo "DSS Version: ${DSS_VERSION}"
echo "Node Type: ${NODE_TYPE}"

DSS_HOME=${DSS_HOME:-/data/dss_data}
DSS_VERSION=${DSS_VERSION}
NODE_TYPE=${NODE_TYPE}

start_dss() {
    echo "Starting DSS..."
#    if [ ! -f "$DSS_DATADIR"/bin/env-default.sh ]; then
#            # Initialize new data directory
#            ./dataiku-dss-${DSS_VERSION}/installer.sh -d "$DSS_DATADIR" -p "$DSS_PORT"
#            ${DSS_HOME}/bin/dssadmin install-R-integration
#            ${DSS_HOME}/bin/dssadmin install-graphics-export
#            echo "dku.registration.channel=docker-image" >>${DSS_HOME}/config/dip.properties
#            echo "dku.exports.chrome.sandbox=false" >>${DSS_HOME}/config/dip.properties
#
#    elif [ $(bash -c 'source "$DSS_DATADIR"/bin/env-default.sh && echo "$DKUINSTALLDIR"') != "$DSS_INSTALLDIR" ]; then
#            # Upgrade existing data directory
#            rm -rf "$DSS_DATADIR"/pyenv
#            ./dataiku-dss-${DSS_VERSION}/installer.sh -d "$DSS_DATADIR" -u -y
#            ${DSS_HOME}/bin/dssadmin install-R-integration
#            ${DSS_HOME}/bin/dssadmin install-graphics-export
#
#    fi
    ${DSS_HOME}/bin/dss start
    ${DSS_HOME}/bin/dss status
    tail -f ${DSS_HOME}/run/install.log
}

stop_dss() {
    echo "Stopping DSS..."
    ${DSS_HOME}/bin/dss stop
}

restart_dss() { 
    echo "Restarting DSS..." 
     ${DSS_HOME}/bin/dss restart
     ${DSS_HOME}/bin/dss status
}

health_check() {
    echo "DSS Health Check:"
    if ${DSS_HOME}/bin/dss status | grep -q "RUNNING"; then
        echo "DSS is running"
        exit 0
    else
        echo "DSS is NOT running"
        exit 1
    fi
}

install_dss() {
    echo "🔧 Installing DSS..."
    if [ -z "${DSS_VERSION}" ]; then
        echo "DSS version not specified. "
        exit 1
    else
        echo "Installing DSS version: DSS_VERSION=${DSS_VERSION}"
    fi
    if [ -z "${NODE_TYPE}" ]; then
        NODE_TYPE="design"
        echo "DSS version not specified. Using default: ${NODE_TYPE}"
    else
        echo "Installing DSS version: DSS_VERSION=${DSS_VERSION}" NODE_TYPE="${NODE_TYPE}"
    fi    
    ./dataiku-dss-${DSS_VERSION}/installer.sh -t ${NODE_TYPE} -d ${DSS_HOME} -p 11000
    ${DSS_HOME}/bin/dssadmin install-R-integration
    ${DSS_HOME}/bin/dssadmin install-graphics-export

    exit 0
}
upgrade_dss() {
    echo "Upgrading DSS..."
    if [ -z "${DSS_VERSION}" ]; then
        echo "DSS version not specified."
        exit 1
    else
        echo "Installing DSS version: DSS_VERSION=${DSS_VERSION}"
    fi
    if [ -z "${NODE_TYPE}" ]; then
        NODE_TYPE="design"
        echo "DSS version not specified. Using default: ${NODE_TYPE}"
    else
        echo "Installing DSS version:${DSS_VERSION} NODE_TYPE:${NODE_TYPE}"
    fi    
    ./dataiku-dss-${DSS_VERSION}/installer.sh -t ${NODE_TYPE} -d ${DSS_HOME} -u -y
    ${DSS_HOME}/bin/dssadmin install-R-integration
    ${DSS_HOME}/bin/dssadmin install-graphics-export

    exit 0
    
 }

case "$1" in
    start)
        start_dss
        ;;
    stop)
        stop_dss
        ;;
    restart)
        restart_dss
        ;;
    health)
        health_check
        ;;
    install)
        install_dss
        start_dss
        ;;  
    upgrade)
        upgrade_dss
        start_dss
        ;; 
    *)
        echo "Usage: $0 {start|stop|restart|health}"
        exit 1
        ;;
esac
