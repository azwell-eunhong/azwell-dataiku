#!/bin/bash
set -e
echo "Starting Dataiku DSS entrypoint script..."
echo $1
echo $2
echo $3

DSS_HOME=${DSS_HOME:-/data/dss_data}

start_dss() {
    echo "Starting DSS..."
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
    echo "❤DSS Health Check:"
    if ${DSS_HOME}/bin/dss status | grep -q "RUNNING"; then
        echo "✅ DSS is running"
        exit 0
    else
        echo "DSS is NOT running"
        exit 1
    fi
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
    *)
        echo "Usage: $0 {start|stop|restart|health}"
        exit 1
        ;;
esac
