#!/bin/bash

set -o errexit

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export ROOT_FOLDER=$( pwd )
export REPO_RESOURCE=repo
export TOOLS_RESOURCE=tools
export VERSION_RESOURCE=version
export FUNCTIONS_FOLDER=${ROOT_FOLDER}/${TOOLS_RESOURCE}/functions

echo "Root folder is [${ROOT_FOLDER}]"
echo "Repo resource folder is [${REPO_RESOURCE}]"
echo "Tools resource folder is [${TOOLS_RESOURCE}]"
echo "Version resource folder is [${VERSION_RESOURCE}]"
echo "Functions folder is [${FUNCTIONS_FOLDER}]"

PIPELINE_VERSION=$( cat ${ROOT_FOLDER}/${VERSION_RESOURCE}/version )
echo "Generated pipeline version is [${PIPELINE_VERSION}]"

cd ${ROOT_FOLDER}/${REPO_RESOURCE}

export USE_PIPELINE_VERSION=false

[[ -f "${FUNCTIONS_FOLDER}/projectType/pipeline-jvm.sh" ]] && source "${FUNCTIONS_FOLDER}/projectType/pipeline-jvm.sh" || \
    echo "No ${FUNCTIONS_FOLDER}/projectType/pipeline-jvm.sh found"

PROJECT_VERSION=$( retrieveVersion )
echo "Project version is [${PROJECT_VERSION}]"

echo "${PROJECT_VERSION}" > ${ROOT_FOLDER}/${VERSION_RESOURCE}/version
