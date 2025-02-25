#!/usr/bin/env bash

CMD=$(basename "$0")

DIR="/host"
if [ ! -d "${DIR}" ]; then
    echo "Failed to file host directory at expected location: ${DIR}"
    exit 1
fi

exec chroot $DIR /usr/bin/env -i PATH="/sbin:/bin:/usr/bin" ${CMD} "${@:1}"
