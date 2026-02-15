# compose-localstack

A small, practical LocalStack setup focused on just **S3** and **SQS**.

If you want the bigger picture first, read [`LOCALSTACK.md`](LOCALSTACK.md).

## Prerequisites

- Docker + Docker Compose
- AWS CLI v2
- Bash + curl

## Project tree

```text
.
├── docker-compose.yml                # Starts LocalStack with only S3 + SQS
├── LOCALSTACK.md                     # Human-friendly explainer: what LocalStack is and when to use it
├── sample-data/
│   └── hello.txt                     # Tiny file uploaded to S3 in the sample flow
├── scripts/
│   ├── create_s3_sample.sh           # Creates bucket + uploads sample object
│   ├── create_sqs_sample.sh          # Creates queue + sends/receives one message
│   └── smoke.sh                      # Waits for readiness and runs both checks
└── .github/workflows/
    └── smoke.yml                     # CI smoke job: compose up, then run smoke script
```

## Quick start

1. Start LocalStack:

   ```bash
   docker compose up -d
   ```

2. Export dummy credentials (LocalStack accepts these test values):

   ```bash
   export AWS_ACCESS_KEY_ID=test
   export AWS_SECRET_ACCESS_KEY=test
   export AWS_DEFAULT_REGION=us-east-1
   ```

3. Run the smoke flow:

   ```bash
   ./scripts/smoke.sh
   ```

## What each script does

- `create_s3_sample.sh`
  - Creates bucket `demo-bucket`
  - Uploads `sample-data/hello.txt` as `s3://demo-bucket/hello.txt`

- `create_sqs_sample.sh`
  - Creates queue `demo-queue`
  - Sends one message (`hello-from-localstack`)
  - Reads one message back from the queue

- `smoke.sh`
  - Waits until LocalStack reports S3/SQS as available
  - Runs both scripts so you can validate storage + messaging in one go

## CI pipeline

The GitHub Actions workflow (`.github/workflows/smoke.yml`) stays intentionally lightweight:

1. `docker compose up -d`
2. `./scripts/smoke.sh`

That gives a quick confidence check without turning this repo into a heavy test suite.
