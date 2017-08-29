#!/bin/bash

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PIPELINE_NAME=${1:-github-webhook}
ALIAS=${2:-docker}
CREDENTIALS=${3:-credentials.yml}

fly -t "${ALIAS}" sp -p "${PIPELINE_NAME}" -c "${__DIR}/pipeline.yml" -l "${__DIR}/${CREDENTIALS}" -n
