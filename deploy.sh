#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"
NAME=$(basename "${DIR}")
MODS="${HOME}/.factorio/mods"
REGEX=".*/LICENSE\|.*\.lua\|.*\.json"
MODNAME=$(jq -r .name "${DIR}/info.json")
VERSION=$(jq -r .version "${DIR}/info.json")
ZIPNAME="${MODNAME}_${VERSION}.zip"

(cd "${DIR}/.." && \
    rm -rf "${ZIPNAME}" &&
    find "${NAME}" -regex "${REGEX}" | xargs zip "${ZIPNAME}" &&
    mv "${ZIPNAME}" "${MODS}")
