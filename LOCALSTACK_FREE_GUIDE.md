# What is LocalStack?

LocalStack is a local cloud emulator that lets you run many AWS APIs on your machine for development/testing, avoiding cloud cost and speeding up feedback loops.

## Why use it here?
- Fast local iteration for S3 and SQS flows
- No AWS account needed for basic local tests
- Easy CI smoke checks with Docker

## LocalStack free-tier service examples
LocalStack Community (free) commonly includes services such as:
- S3
- SQS
- Lambda
- SNS
- DynamoDB
- API Gateway
- CloudWatch (core APIs)
- IAM (core APIs)
- STS
- Kinesis
- Secrets Manager (core APIs)
- EventBridge (core APIs)

> Note: exact service depth can vary by LocalStack version. This repository intentionally enables only **S3** and **SQS** for minimal resource usage.

## Mini cheatsheet
```bash
# Start stack
docker compose up -d

# Run smoke flow
chmod +x scripts/*.sh
./scripts/smoke.sh

# Stop stack
docker compose down -v
```
