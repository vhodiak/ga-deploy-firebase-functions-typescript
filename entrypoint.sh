#!/bin/sh

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${TARGET}" ]; then
    echo "TARGET is missing"
    TARGET = "default"
fi


if [ -z "${DEPLOY_ONLY}" ]; then
    echo "DEPLOY_ONLY is missing"
    DEPLOY_ONLY = "functions"
fi
echo "Dir:"
pwd
ls -la

# if RUN_NPM_CI is not empty and set to true, run npm ci
if [ -n "${RUN_NPM_CI}" ] && [ "${RUN_NPM_CI}" = "true" ]; then
    echo "run: npm ci --prefix ${WORKING_DIRECTORY}"
    npm ci --prefix ${WORKING_DIRECTORY}
    
fi

# if RUN_NPM_BUILD is not empty and set to true, run npm run build
if [ -n "${RUN_NPM_BUILD}" ] && [ "${RUN_NPM_BUILD}" = "true" ]; then
    echo "run: npm run build --prefix ${WORKING_DIRECTORY}"
    npm run build --prefix ${WORKING_DIRECTORY}
fi

echo "result"
ls -la

echo "Begin deploy:"

firebase use ${TARGET}

firebase deploy --token ${FIREBASE_TOKEN} --only ${DEPLOY_ONLY}
