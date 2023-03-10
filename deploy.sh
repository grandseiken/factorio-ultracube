#!/bin/bash
set -e
if [ -z "$1" ]; then
  FACTORIO_DIR="${HOME}/.factorio"
else
  FACTORIO_DIR="$1"
fi

DIR="$(dirname "$(readlink -f "$0")")"
NAME=$(basename "${DIR}")
MODS="${FACTORIO_DIR}/mods"
REGEX=".*/LICENSE$\|.*\.lua$\|.*\.cfg$\|.*\.json$\|.*\.md$"
MODNAME=$(jq -r .name "${DIR}/info.json")
VERSION=$(jq -r .version "${DIR}/info.json")
ZIPNAME="${MODNAME}_${VERSION}.zip"

ZIP_CMD="zip"
if [[ "$OSTYPE" == "msys" ]]; then
  ZIP_CMD="7z a -tzip"
fi

(cd "${DIR}/.." && \
    rm -rf "${ZIPNAME}" &&
    find "${NAME}" -regex "${REGEX}" | xargs ${ZIP_CMD} "${ZIPNAME}" &&
    mv "${ZIPNAME}" "${MODS}")
