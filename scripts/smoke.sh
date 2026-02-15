#!/usr/bin/env bash
set -euo pipefail

ENDPOINT_URL="${ENDPOINT_URL:-http://localhost:4566}"
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-test}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-test}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-us-east-1}"
export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION

echo "Waiting for LocalStack at $ENDPOINT_URL ..."
until curl -fsS "$ENDPOINT_URL/_localstack/health" | grep -q '"s3": "available"'; do
  sleep 2
done
until curl -fsS "$ENDPOINT_URL/_localstack/health" | grep -q '"sqs": "available"'; do
  sleep 2
done

scripts/create_s3_sample.sh
scripts/create_sqs_sample.sh

echo "Smoke check passed."
