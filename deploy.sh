#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"
NAME=$(basename "${DIR}")
MODS="${HOME}/.factorio/mods"
REGEX=".*/LICENSE\|.*\.lua"
(cd "${DIR}/.." && \
    rm -rf "${NAME}.zip" &&
    find "${NAME}" -regex "${REGEX}" | xargs zip "${NAME}.zip" &&
    mv "${NAME}.zip" "${MODS}")
