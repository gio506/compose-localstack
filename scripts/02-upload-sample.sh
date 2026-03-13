#!/usr/bin/env bash
set -euo pipefail

. "$(dirname "$0")/common.sh"

docker_exec "cat > /tmp/${FILE_NAME} <<'EOF'
Hello from LocalStack S3 sample file.
EOF"

docker_exec \
  "aws --endpoint-url=${ENDPOINT_URL} s3 cp /tmp/${FILE_NAME} s3://${BUCKET_NAME}/${FILE_NAME}"

echo "Uploaded ${FILE_NAME} to s3://${BUCKET_NAME}/${FILE_NAME}"
