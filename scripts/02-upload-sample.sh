#!/usr/bin/env bash
set -euo pipefail

BUCKET_NAME="demo-localstack-bucket"
FILE_NAME="sample.txt"
ENDPOINT_URL="http://localhost:4566"

docker compose exec -T localstack bash -lc "cat > /tmp/${FILE_NAME} <<'EOF'
Hello from LocalStack S3 sample file.
EOF"

docker compose exec -T localstack bash -lc \
  "aws --endpoint-url=${ENDPOINT_URL} s3 cp /tmp/${FILE_NAME} s3://${BUCKET_NAME}/${FILE_NAME}"

echo "Uploaded ${FILE_NAME} to s3://${BUCKET_NAME}/${FILE_NAME}"
