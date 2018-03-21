#!/usr/bin/env bash

echo -e "\nCreate ssh config module\n"
echo
echo -n "Module name: "
read NAME
echo

if [ -e "${NAME}" ]
then
    echo "Module exists"

    exit 0
fi

SCRIPT_DIR="$(realpath `dirname "$0"`)"
mkdir -p "${SCRIPT_DIR}/${NAME}/keys"

touch "${SCRIPT_DIR}/${NAME}/config"

echo -e "\nCompleted\n"
