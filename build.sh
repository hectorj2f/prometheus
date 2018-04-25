#!/usr/bin/env bash
set -e

FRAMEWORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR=$FRAMEWORK_DIR/build/distributions

FRAMEWORK_NAME=prometheus

# Build/test our scheduler.zip
${FRAMEWORK_DIR}/gradlew -p ${FRAMEWORK_DIR} check distZip

DOCUMENTATION_PATH="https://github.com/mesosphere/dcos-commons-siumulation/blob/master/monitor/prometheus/README.md" \
    $FRAMEWORK_DIR/tools/build_framework.sh \
        $FRAMEWORK_NAME \
        $FRAMEWORK_DIR \
        -a "$BUILD_DIR/${FRAMEWORK_NAME}-scheduler.zip" \
        -a "$FRAMEWORK_DIR/sdk/cli/dcos-service-cli-linux" \
    	-a "$FRAMEWORK_DIR/sdk/cli/dcos-service-cli-darwin" \
    	-a "$FRAMEWORK_DIR/sdk/cli/dcos-service-cli.exe" \
        $@
