#!/usr/bin/env bash
set -euo pipefail

. "$(dirname "$0")/common.sh"

wait_for_localstack

./scripts/01-create-bucket.sh
./scripts/02-upload-sample.sh
./scripts/03-create-queue.sh
./scripts/04-send-receive-message.sh

bucket_listing="$(docker_exec "aws --endpoint-url=${ENDPOINT_URL} s3 ls s3://${BUCKET_NAME}")"
printf '%s\n' "$bucket_listing"
grep -q "$FILE_NAME" <<<"$bucket_listing"

echo "Smoke test completed successfully."
