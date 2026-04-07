# AWS LocalStack Lab — Concepts and Use Cases

Notes on AWS services simulated in this lab and when you'd use them in real projects.

---

## S3 — Object Storage

Used in this lab to simulate file uploads and bucket operations.

### Real-world patterns

**Application config storage** — Store environment-specific configs as S3 objects:

```bash
# Upload config
aws s3 cp config/prod.json s3://my-app-configs/prod.json

# Application downloads on startup
aws s3 cp s3://my-app-configs/prod.json /tmp/config.json
```

**Static website hosting** — Set bucket as website host:

```bash
aws s3 website s3://my-static-site/ \
  --index-document index.html \
  --error-document 404.html
```

**Data pipeline staging area** — Temp storage between processing stages:

```text
Raw CSV → S3/raw/ → Lambda processes → S3/processed/ → Load into RDS
```

### Key S3 Concepts

| Concept | Explanation |
|---|---|
| Bucket | Top-level container. Globally unique name. |
| Object | File stored in a bucket, identified by key (path) |
| Presigned URL | Temporary URL granting access to private object |
| Versioning | Keeps all versions — useful for accidental deletion recovery |
| Lifecycle rules | Automatically move to cheaper storage tiers or delete |

---

## SQS — Message Queue

Used in this lab to demonstrate async message passing between producer and consumer.

### Why SQS instead of direct API calls?

**Decoupling**: Producer doesn't need to know if the consumer is up.
**Buffering**: If consumer is slow, messages wait in queue instead of getting dropped.
**Retry**: Failed messages go to Dead Letter Queue (DLQ) for inspection.

### Real-world pattern: Order processing

```text
User submits order
  → API writes order to SQS
  → Returns 202 Accepted immediately (no waiting)
  → Worker picks up from SQS
  → Processes payment
  → Updates database
  → Sends confirmation email
```

### SQS Message Types

| Type | Behavior | Use Case |
|---|---|---|
| Standard Queue | At-least-once, best-effort ordering | High throughput workloads |
| FIFO Queue | Exactly-once, strict ordering | Financial transactions |

---

## LocalStack vs Real AWS

| Feature | LocalStack (free tier) | Real AWS |
|---|---|---|
| S3 basic ops | ✅ Full | ✅ Full |
| SQS | ✅ Full | ✅ Full |
| DynamoDB | ✅ Full | ✅ Full |
| Lambda | ⚠️ Limited (community) | ✅ Full |
| RDS | ❌ Not available | ✅ Full |
| Cost | Free | Pay per use |

**Rule of thumb**: Use LocalStack for integration tests and local development. Never test IAM policies locally — always verify on a real AWS account.
