# Files Explained

- `.github/workflows/pipeline.yml`: validates the Compose file, runs the smoke flow, and tears the stack down.
- `.gitkeep`: placeholder file retained from the starter repository.
- `CHEATSHEET.md`: quick command reference for common LocalStack tasks.
- `FILES_EXPLAINED.md`: short purpose statement for every tracked file.
- `LOCALSTACK_FREE_GUIDE.md`: notes about free-tier services and practical usage limits.
- `README.md`: main guide for setup, execution, verification, and cleanup.
- `docker-compose.yml`: starts LocalStack with only S3 and SQS plus a healthcheck.
- `scripts/01-create-bucket.sh`: creates the demo S3 bucket.
- `scripts/02-upload-sample.sh`: uploads a sample object into the bucket.
- `scripts/03-create-queue.sh`: creates the demo SQS queue.
- `scripts/04-send-receive-message.sh`: sends and receives one SQS message and verifies the response.
- `scripts/common.sh`: shared environment variables, docker exec helper, and readiness wait loop.
- `scripts/smoke.sh`: runs the complete S3 and SQS smoke flow.
