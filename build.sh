#!/usr/bin/env bash

SCRIPT_DIR="$(realpath $(dirname "$0"))"
CHECK_ICON=$'\x1B[32m\xE2\x9C\x94\x1B[0m'
CONFIG_FILE="${SCRIPT_DIR}/config"

echo -e "\nBuild config modules to config file\n"
echo

cat "${SCRIPT_DIR}/_base" >"${CONFIG_FILE}"

echo -e "Import configs:\n"

LOOP_INDEX=0

for file in ${SCRIPT_DIR}/*/; do
  if [[ -d "$file" && ! -L "$file" ]]; then
    file=${file%*/}

    # Check if config is in backlist then skip
    if [ -e "${file}/skip" ]; then
      continue
    fi

    if [ -e "${file}/config" ]; then
      LOOP_INDEX=$(expr $LOOP_INDEX + 1)
      echo -n "${LOOP_INDEX}. ${file}"

      echo -e "\n\n" >>"${CONFIG_FILE}"

      echo "#" >>"${CONFIG_FILE}"
      echo "# ${file}" >>"${CONFIG_FILE}"
      echo "#------" >>"${CONFIG_FILE}"
      echo "" >>"${CONFIG_FILE}"

      cat "${file}/config" >>"${CONFIG_FILE}"

      echo -e "\x1B[32m \xE2\x9C\x94 \x1B[0m"
    fi
  fi
done

if [ "$LOOP_INDEX" -lt 1 ]; then
  echo " - None of files"
fi

echo -e "\n\nCompleted\n"
