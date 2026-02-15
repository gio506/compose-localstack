# compose-localstack

Minimal LocalStack setup for **S3 + SQS only** using Docker Compose.

## Prerequisites
- Docker + Docker Compose plugin
- Bash shell (Linux/macOS/WSL)

## Project tree
```text
.
├── docker-compose.yml              # Runs LocalStack with only S3 and SQS enabled
├── README.md                       # Setup guide and usage steps
├── CHEATSHEET.md                   # Quick command reference for day-to-day use
├── LOCALSTACK_FREE_GUIDE.md        # What LocalStack is + free-tier service overview
├── scripts/
│   ├── 01-create-bucket.sh         # Creates demo S3 bucket
│   ├── 02-upload-sample.sh         # Uploads sample file to the bucket
│   ├── 03-create-queue.sh          # Creates demo SQS queue
│   ├── 04-send-receive-message.sh  # Sends/receives one queue message
│   └── smoke.sh                    # Runs all scripts in sequence
└── .github/workflows/pipeline.yml  # CI pipeline: start stack + run smoke
```

## Step-by-step
1. Start LocalStack
   ```bash
   docker compose up -d
   ```

2. Make scripts executable
   ```bash
   chmod +x scripts/*.sh
   ```

3. Run smoke flow (S3 + SQS)
   ```bash
   ./scripts/smoke.sh
   ```

4. Optional cleanup
   ```bash
   docker compose down -v
   ```

## What the scripts do
- `01-create-bucket.sh`: creates bucket `demo-localstack-bucket`
- `02-upload-sample.sh`: uploads `/tmp/sample.txt` into the demo bucket
- `03-create-queue.sh`: creates queue `demo-localstack-queue`
- `04-send-receive-message.sh`: sends and then receives one test message
- `smoke.sh`: runs all scripts end-to-end

## CI pipeline (1–2 stages)
- **Stage 1**: `docker compose up -d`
- **Stage 2**: run `./scripts/smoke.sh`
