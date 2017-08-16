#!/bin/bash

TARGET=${1:-docker}
ROOT_ADDRESS=localhost
CONCOURSE_URL=${2:-"http://${ROOT_ADDRESS}:8080"}
CONCOURSE_USER=${3:-concourse}
CONCOURSE_PASSWORD=${4:-changeme}
TEAM=${5:-main}

fly -t "${TARGET}" login -c "${CONCOURSE_URL}" -u "${CONCOURSE_USER}" -p "${CONCOURSE_PASSWORD}" -n "${TEAM}"
