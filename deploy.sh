#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"
NAME=$(basename "${DIR}")
MODS="${HOME}/.factorio/mods"
REGEX=".*/LICENSE\|.*\.lua\|.*\.json"
VERSION=$(grep '"version"' "${DIR}/info.json" | grep -o '[0-9.]\+')
ZIPNAME="${NAME}_${VERSION}.zip"

(cd "${DIR}/.." && \
    rm -rf "${NAME}.zip" &&
    find "${NAME}" -regex "${REGEX}" | xargs zip "${ZIPNAME}" &&
    mv "${ZIPNAME}" "${MODS}")
