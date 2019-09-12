#!/usr/bin/bash

install_path=$1
pyside2_version=$2
pyside2_url=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] PYSIDE2 VERSION: ${pyside2_version}"

cd $build_path

# We finally install PySide2
echo -e "\n"
echo -e "[INSTALL] Installing PySide2-${pyside2_version}..."
echo -e "\n"

# We copy the necessary files to the install directory
pip install ${pyside2_url} --target ${install_path} --upgrade --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing PySide2-${pyside2_version}!"
echo -e "\n"
