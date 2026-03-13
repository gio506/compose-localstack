#!/usr/bin/env bash
set -euo pipefail

. "$(dirname "$0")/common.sh"

docker_exec \
  "aws --endpoint-url=${ENDPOINT_URL} s3api create-bucket --bucket ${BUCKET_NAME}"

echo "Bucket created: ${BUCKET_NAME}"
