#!/usr/bin/env bash
set -euo pipefail

QUEUE_NAME="demo-localstack-queue"
ENDPOINT_URL="http://localhost:4566"

docker compose exec -T localstack bash -lc \
  "aws --endpoint-url=${ENDPOINT_URL} sqs create-queue --queue-name ${QUEUE_NAME}"

echo "Queue created: ${QUEUE_NAME}"
