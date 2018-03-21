#!/usr/bin/env bash

CHECK_ICON=$'\x1B[32m\xE2\x9C\x94\x1B[0m'

echo -e "\nBuild config modules to config file\n"
echo
cat ./_base > ./config

echo -e "Import configs:\n"

LOOP_INDEX=0

for file in */ ; do
    if [[ -d "$file" && ! -L "$file" ]]; then
        file=${file%*/}

        if [ -e "${file}/config" ]; then
            LOOP_INDEX=$(expr $LOOP_INDEX + 1)
            echo -n "${LOOP_INDEX}. ${file}"

            echo -e "\n\n" >> ./config

            echo "#" >> ./config
            echo "# ${file}" >> ./config
            echo "#------" >> ./config
            echo "" >> ./config

            cat "${file}/config" >> ./config

            echo -e "\x1B[32m \xE2\x9C\x94 \x1B[0m"
        fi
  fi
done

if [ "$LOOP_INDEX" -lt 1 ]; then
    echo " - None of files"
fi

echo -e "\n\nCompleted\n"