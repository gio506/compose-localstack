#!/usr/bin/env bash
set -euo pipefail

ENDPOINT_URL="${ENDPOINT_URL:-http://localhost:4566}"
REGION="${AWS_DEFAULT_REGION:-us-east-1}"
BUCKET_NAME="${BUCKET_NAME:-demo-bucket}"
SAMPLE_FILE="${SAMPLE_FILE:-sample-data/hello.txt}"

aws --endpoint-url "$ENDPOINT_URL" --region "$REGION" s3api create-bucket --bucket "$BUCKET_NAME" >/dev/null 2>&1 || true
aws --endpoint-url "$ENDPOINT_URL" --region "$REGION" s3 cp "$SAMPLE_FILE" "s3://$BUCKET_NAME/hello.txt" >/dev/null

echo "S3 ready: bucket=$BUCKET_NAME, object=hello.txt"
