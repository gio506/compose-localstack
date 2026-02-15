#!/usr/bin/env bash
set -euo pipefail

ENDPOINT_URL="${ENDPOINT_URL:-http://localhost:4566}"
REGION="${AWS_DEFAULT_REGION:-us-east-1}"
QUEUE_NAME="${QUEUE_NAME:-demo-queue}"
MESSAGE_BODY="${MESSAGE_BODY:-hello-from-localstack}"

aws --endpoint-url "$ENDPOINT_URL" --region "$REGION" sqs create-queue --queue-name "$QUEUE_NAME" >/dev/null
QUEUE_URL="$(aws --endpoint-url "$ENDPOINT_URL" --region "$REGION" sqs get-queue-url --queue-name "$QUEUE_NAME" --query 'QueueUrl' --output text)"
aws --endpoint-url "$ENDPOINT_URL" --region "$REGION" sqs send-message --queue-url "$QUEUE_URL" --message-body "$MESSAGE_BODY" >/dev/null
RECEIVED_BODY="$(aws --endpoint-url "$ENDPOINT_URL" --region "$REGION" sqs receive-message --queue-url "$QUEUE_URL" --max-number-of-messages 1 --wait-time-seconds 1 --query 'Messages[0].Body' --output text)"

echo "SQS ready: queue=$QUEUE_NAME, received=$RECEIVED_BODY"
