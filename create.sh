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

mkdir "${NAME}"
mkdir "${NAME}/keys"

touch "${NAME}/config"

echo -e "\nCompleted\n"