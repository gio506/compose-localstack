# LocalStack Free Guide

## What is LocalStack?
LocalStack is a local AWS cloud emulator. It lets you run many AWS-compatible APIs on your machine or CI runner, so you can build and test without deploying to real AWS for every change.

## Why teams use it
- Faster feedback loops (seconds/minutes instead of cloud deploy cycles)
- Lower dev/test cost
- Works offline or in restricted environments
- Deterministic local integration tests

## Community (free) services — what they are + how to use them
> Important: LocalStack Community service coverage can change by version. Service names below are commonly available in free/community edition, but specific API completeness can vary.

### 1) S3 (Simple Storage Service)
- **What it is:** Object storage (files/blobs).
- **Typical use:** Upload/download files, store exports, host static assets.
- **In local dev:** Test file workflows, object naming, retention and retrieval logic.

### 2) SQS (Simple Queue Service)
- **What it is:** Managed queue for asynchronous messaging.
- **Typical use:** Decouple producer/consumer services, background jobs.
- **In local dev:** Validate send/receive/retry/visibility-timeout logic.

### 3) SNS (Simple Notification Service)
- **What it is:** Pub/Sub notification fan-out service.
- **Typical use:** One event to many subscribers (queues, HTTP endpoints, etc.).
- **In local dev:** Test event fan-out and subscription wiring.

### 4) Lambda
- **What it is:** Event-driven serverless function runtime.
- **Typical use:** Lightweight compute triggered by events.
- **In local dev:** Validate function handlers and event payload contracts.

### 5) DynamoDB
- **What it is:** NoSQL key-value/document database.
- **Typical use:** Session/cart/profile/state storage with high throughput patterns.
- **In local dev:** Test table design, keys, query patterns, and update logic.

### 6) API Gateway
- **What it is:** Managed API front door (routing + request handling).
- **Typical use:** Expose REST/HTTP endpoints in front of services/Lambda.
- **In local dev:** Verify API routes, integrations, and response mapping basics.

### 7) CloudWatch (core APIs)
- **What it is:** Logs/metrics/monitoring ecosystem.
- **Typical use:** Aggregate logs and track service behavior.
- **In local dev:** Exercise log pipelines and basic monitoring integration.

### 8) IAM (core APIs)
- **What it is:** Identity and access management.
- **Typical use:** Users, roles, policies, and permission boundaries.
- **In local dev:** Simulate auth/policy wiring for apps and automation.

### 9) STS (Security Token Service)
- **What it is:** Temporary credentials and identity introspection.
- **Typical use:** Assume role flows and caller identity checks.
- **In local dev:** Validate role assumption/auth bootstrap behavior.

### 10) Kinesis
- **What it is:** Real-time event streaming service.
- **Typical use:** Ingest and process ordered event streams.
- **In local dev:** Test producer/consumer code for streaming pipelines.

### 11) EventBridge (core APIs)
- **What it is:** Event bus + rule-based routing.
- **Typical use:** Route application/domain events to targets.
- **In local dev:** Validate event pattern matching and rule targets.

### 12) Secrets Manager (core APIs)
- **What it is:** Secrets/key-value storage with access controls.
- **Typical use:** Store API keys, tokens, DB credentials.
- **In local dev:** Test secret retrieval paths without exposing real secrets.

## What this repo enables (minimal by design)
This repository enables only:
- `S3`
- `SQS`

Configured in `docker-compose.yml` via:
```yaml
SERVICES=s3,sqs
```

This keeps startup and resource usage minimal for focused S3/SQS demos.

## Mini operational cheatsheet
```bash
# Start LocalStack
docker compose up -d

# Run full smoke script
chmod +x scripts/*.sh
./scripts/smoke.sh

# Follow logs
docker compose logs -f localstack

# Stop and cleanup
docker compose down -v
```
