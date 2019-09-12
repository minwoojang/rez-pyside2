CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)

set(pyside2_version 5.12.5)

# PySide2
rez_set_archive(
    # This is a relative path from the ${REZ_REPO_PAYLOAD_DIR} environment variable,
    # that is pointing to the root directory where we can find all the archives of the package
    # we can build, using the following hierarchy:
    # "${REZ_REPO_PAYLOAD_DIR}/project_name/archive.what.ever"
    pyside2_url pyside2/PySide2-${pyside2_version}-${pyside2_version}-cp27-cp27mu-manylinux1_x86_64.whl
    https://download.qt.io/official_releases/QtForPython/pyside2/PySide2-5.12.5-5.12.5-cp27-cp27mu-manylinux1_x86_64.whl
)

# In the case of a Python pip wheel file, we do not have any archive to extract, so we can just execute our Bash
# script(s) inside an "execute_process" macro.
execute_process(
    COMMAND
    bash ${CMAKE_SOURCE_DIR}/install.sh ${CMAKE_INSTALL_PREFIX} ${pyside2_version} ${pyside2_url}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] Pyside2-${pyside2_version} PACKAGE SETUP FINISHED!\n\"
    )"
)
