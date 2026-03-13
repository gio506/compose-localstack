#!/usr/bin/env bash
set -euo pipefail

LOCALSTACK_CONTAINER="${LOCALSTACK_CONTAINER:-localstack}"
ENDPOINT_URL="${ENDPOINT_URL:-http://localhost:4566}"
AWS_REGION="${AWS_REGION:-us-east-1}"
BUCKET_NAME="${BUCKET_NAME:-demo-localstack-bucket}"
QUEUE_NAME="${QUEUE_NAME:-demo-localstack-queue}"
FILE_NAME="${FILE_NAME:-sample.txt}"
MESSAGE_BODY="${MESSAGE_BODY:-Hello from LocalStack SQS}"

docker_exec() {
  docker compose exec -T "$LOCALSTACK_CONTAINER" bash -lc "$1"
}

wait_for_localstack() {
  local attempts=30
  local sleep_seconds=2

  for ((i=1; i<=attempts; i++)); do
    if docker_exec "awslocal s3api list-buckets >/dev/null 2>&1 && awslocal sqs list-queues >/dev/null 2>&1"; then
      echo "LocalStack is ready."
      return 0
    fi

    sleep "$sleep_seconds"
  done

  echo "LocalStack did not become ready in time." >&2
  return 1
}
