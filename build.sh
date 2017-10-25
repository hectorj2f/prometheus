#!/usr/bin/env bash
set -e

FRAMEWORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR=$FRAMEWORK_DIR/build/distributions

FRAMEWORK_NAME=prometheus

DOCUMENTATION_PATH="https://github.com/mesosphere/dcos-commons-siumulation/blob/master/monitor/prometheus/README.md" \
    $FRAMEWORK_DIR/tools/build_framework.sh \
        $FRAMEWORK_NAME \
        $FRAMEWORK_DIR \
        --artifact "$BUILD_DIR/${FRAMEWORK_NAME}-scheduler.zip" \
        $@
