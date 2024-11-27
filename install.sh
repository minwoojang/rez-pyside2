#!/usr/bin/bash

set -e

INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
PYSIDE_URL=$1
PYSIDE_VERSION=${REZ_BUILD_PROJECT_VERSION}

echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] PYSIDE2 URL: ${PYSIDE_URL}"
echo -e "[INSTALL][ARGS] PYSIDE2 VERSION: ${PYSIDE_VERSION}"

if [[ -z ${INSTALL_PATH} || -z ${PYSIDE_URL} || -z ${PYSIDE_VERSION} ]]; then
    echo -e "\n"
    echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"
    exit 1
fi

echo -e "\n"
echo -e "[INSTALL] Installing PySide2-${PYSIDE_VERSION}..."
echo -e "\n"

python3.9 -m pip \
    install ${PYSIDE_URL} \
    --target ${INSTALL_PATH} \
    --upgrade \
    --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Installing shiboken2-${PYSIDE_VERSION}..."
echo -e "\n"

python3.9 -m pip \
    install shiboken2==${PYSIDE_VERSION} \
    --target ${INSTALL_PATH} \
    --upgrade \
    --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing PySide2 and shiboken2-${PYSIDE_VERSION}!"
echo -e "\n"

export PYTHONPATH=${INSTALL_PATH}:$PYTHONPATH
