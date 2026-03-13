#!/usr/bin/env bash
set -euo pipefail

. "$(dirname "$0")/common.sh"

QUEUE_URL=$(docker_exec \
  "aws --endpoint-url=${ENDPOINT_URL} sqs get-queue-url --queue-name ${QUEUE_NAME} --query QueueUrl --output text")

docker_exec \
  "aws --endpoint-url=${ENDPOINT_URL} sqs send-message --queue-url '${QUEUE_URL}' --message-body '${MESSAGE_BODY}'"

receive_output="$(docker_exec \
  "aws --endpoint-url=${ENDPOINT_URL} sqs receive-message --queue-url '${QUEUE_URL}' --max-number-of-messages 1 --wait-time-seconds 1")"

printf '%s\n' "$receive_output"
grep -q "$MESSAGE_BODY" <<<"$receive_output"
echo "Message received successfully from ${QUEUE_NAME}"
