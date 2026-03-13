#!/usr/bin/env bash
set -euo pipefail

. "$(dirname "$0")/common.sh"

docker_exec \
  "aws --endpoint-url=${ENDPOINT_URL} sqs create-queue --queue-name ${QUEUE_NAME}"

echo "Queue created: ${QUEUE_NAME}"
