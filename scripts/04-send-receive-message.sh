#!/usr/bin/env bash
set -euo pipefail

QUEUE_NAME="demo-localstack-queue"
ENDPOINT_URL="http://localhost:4566"
MESSAGE_BODY="Hello from LocalStack SQS"

QUEUE_URL=$(docker compose exec -T localstack bash -lc \
  "aws --endpoint-url=${ENDPOINT_URL} sqs get-queue-url --queue-name ${QUEUE_NAME} --query QueueUrl --output text")

# Send message
docker compose exec -T localstack bash -lc \
  "aws --endpoint-url=${ENDPOINT_URL} sqs send-message --queue-url '${QUEUE_URL}' --message-body '${MESSAGE_BODY}'"

# Receive message
docker compose exec -T localstack bash -lc \
  "aws --endpoint-url=${ENDPOINT_URL} sqs receive-message --queue-url '${QUEUE_URL}' --max-number-of-messages 1 --wait-time-seconds 1"
