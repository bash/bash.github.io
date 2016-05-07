#!/bin/bash

FILES=${@:1}
CURRENT_DIRECTORY=`pwd`
TEMP_DIR=$(mktemp -d)
REMOTE_URL=$(git remote get-url --push origin)
BRANCH="master"

cleanup() {
    rm -rf ${TEMP_DIR}
    cd ${CURRENT_DIRECTORY}
}

trap cleanup EXIT

echo "Cloning repository..."
git clone -b ${BRANCH} $(pwd) ${TEMP_DIR} -q
git --git-dir ${TEMP_DIR}/.git remote add upstream ${REMOTE_URL}

echo "Cleaning old files..."

OLD_FILES=$(find ${TEMP_DIR} -maxdepth 1 -mindepth 1 -not -name ".git")

for FILE in ${OLD_FILES}; do
    echo "removing ${FILE}"
    rm -rf ${FILE}
done

echo "Copying new files..."

for FILE in ${FILES}; do
    cp -R ${FILE} ${TEMP_DIR}/
done

cd ${TEMP_DIR}
git add -A
git status

TIMESTAMP=$(date +"%s")

git commit -m "Build #${TIMESTAMP}"
git push upstream master
