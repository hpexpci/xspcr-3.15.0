#!/usr/bin/env bash
/spc/spc --endpoint=$CSI_ENDPOINT &
pid=$!

# trap SIGTERM
trap "echo 'SIGTERM received.'; kill -SIGTERM ${pid}; wait ${pid}" SIGTERM
wait ${pid}
