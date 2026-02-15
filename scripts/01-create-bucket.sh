#!/usr/bin/env bash
set -euo pipefail

BUCKET_NAME="demo-localstack-bucket"
ENDPOINT_URL="http://localhost:4566"

docker compose exec -T localstack bash -lc \
  "aws --endpoint-url=${ENDPOINT_URL} s3api create-bucket --bucket ${BUCKET_NAME}"

echo "Bucket created: ${BUCKET_NAME}"
