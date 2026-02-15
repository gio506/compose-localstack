# Quick Cheatsheet

This file is your fast command + concept reference for this repo.

## 1) Start / Stop LocalStack
```bash
# Start in background
docker compose up -d

# Stop and remove volumes
docker compose down -v
```

## 2) Run the full demo (S3 + SQS)
```bash
chmod +x scripts/*.sh
./scripts/smoke.sh
```

## 3) Run script-by-script (manual flow)
```bash
# 1. Create S3 bucket
./scripts/01-create-bucket.sh

# 2. Upload sample file into that bucket
./scripts/02-upload-sample.sh

# 3. Create SQS queue
./scripts/03-create-queue.sh

# 4. Send + receive one message
./scripts/04-send-receive-message.sh
```

## 4) Useful troubleshooting commands
```bash
# Follow logs
docker compose logs -f localstack

# See container status
docker compose ps

# Restart service
docker compose restart localstack

# Open shell inside LocalStack container
docker compose exec localstack bash
```

## 5) AWS CLI examples against LocalStack endpoint
> Endpoint used in this repo: `http://localhost:4566`

```bash
# List S3 buckets
aws --endpoint-url=http://localhost:4566 s3 ls

# List SQS queues
aws --endpoint-url=http://localhost:4566 sqs list-queues

# Read object from demo bucket
aws --endpoint-url=http://localhost:4566 s3 cp s3://demo-localstack-bucket/sample.txt -
```

## 6) Environment defaults used here
- Region: `us-east-1`
- Access key: `test`
- Secret key: `test`
- Enabled services: `s3,sqs`

## 7) Common LocalStack free/community services (quick view)
These services are commonly available in LocalStack Community. Exact API depth may vary by version.

- **S3**: object storage for files/backups/static assets.
- **SQS**: message queue for async worker communication.
- **SNS**: pub/sub notifications to many consumers.
- **Lambda**: event-driven compute for lightweight functions.
- **DynamoDB**: NoSQL key-value/document data store.
- **API Gateway**: managed-style HTTP API front door.
- **CloudWatch (core APIs)**: logs/metrics/alarm-oriented workflows.
- **IAM (core APIs)**: users/roles/policies for auth simulation.
- **STS**: temporary credentials and caller identity checks.
- **Kinesis**: real-time stream ingestion/processing patterns.
- **EventBridge (core APIs)**: event bus and rule routing.
- **Secrets Manager (core APIs)**: app secret/value storage simulation.

## 8) What this cheatsheet is for
- New team member quick-start
- Live demo script helper
- Fast copy/paste commands during debugging
