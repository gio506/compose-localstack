#!/usr/bin/env bash
set -euo pipefail

./scripts/01-create-bucket.sh
./scripts/02-upload-sample.sh
./scripts/03-create-queue.sh
./scripts/04-send-receive-message.sh

echo "Smoke test completed successfully."
