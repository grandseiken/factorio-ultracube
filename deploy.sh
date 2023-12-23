#!/bin/bash
set -e
if [ -z "$1" ]; then
  if [[ "$OSTYPE" == "msys" ]]; then
    FACTORIO_DIR="${APPDATA}/Factorio"
  else
    FACTORIO_DIR="${HOME}/.factorio"
  fi
else
  FACTORIO_DIR="$1"
fi

DIR="$(dirname "$(readlink -f "$0")")"
NAME=$(basename "${DIR}")
MODS="${FACTORIO_DIR}/mods"
REGEX=".*/LICENSE$\|.*changelog.txt\|.*\.lua$\|.*\.cfg$\|.*\.png$\|.*\.ogg$\|.*\.zip\|.*\.json$\|.*\.md$"
MODNAME=$(jq -r .name "${DIR}/info.json")
VERSION=$(jq -r .version "${DIR}/info.json")
ZIPNAME="${MODNAME}_${VERSION}.zip"

ZIP_CMD="zip"
if [[ "$OSTYPE" == "msys" ]]; then
  ZIP_CMD="7z a -tzip"
fi

function prepend() { while read line; do echo "${1}${line}"; done; }
FILELIST=$(git ls-files | grep "${REGEX}" | prepend "${NAME}/")

(cd "${DIR}/.." && rm -rf "${ZIPNAME}" &&
    echo ${FILELIST} | xargs ${ZIP_CMD} "${ZIPNAME}" &&
    unzip -l "${ZIPNAME}" && mv "${ZIPNAME}" "${MODS}")
