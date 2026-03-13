# compose-localstack

Minimal LocalStack lab for S3 and SQS with a smoke-tested Docker Compose workflow.

## What this project does
- Starts LocalStack with only the free-tier S3 and SQS services enabled.
- Creates a demo S3 bucket and uploads a sample file.
- Creates a demo SQS queue and verifies send/receive behavior.
- Runs the whole flow through a single smoke script and GitHub Actions job.

## Repo map
```text
.
├── .github/workflows/pipeline.yml     # CI: compose validation + LocalStack smoke test
├── .gitkeep                           # placeholder file retained from the starter repo
├── CHEATSHEET.md                      # quick command reference
├── FILES_EXPLAINED.md                 # file-by-file explanation
├── LOCALSTACK_FREE_GUIDE.md           # background notes on LocalStack free-tier usage
├── README.md                          # setup guide, workflow, and verification steps
├── docker-compose.yml                 # LocalStack service definition with healthcheck
└── scripts/
    ├── 01-create-bucket.sh            # creates the demo S3 bucket
    ├── 02-upload-sample.sh            # uploads a sample file into the bucket
    ├── 03-create-queue.sh             # creates the demo SQS queue
    ├── 04-send-receive-message.sh     # sends and receives one queue message
    ├── common.sh                      # shared variables and readiness helper
    └── smoke.sh                       # waits for readiness and runs the full flow
```

## Prerequisites
- Docker Desktop or Docker Engine
- Docker Compose v2
- Bash shell (Linux, macOS, or WSL on Windows)

## Start the lab
```bash
docker compose up -d
```

## Run the smoke flow
```bash
chmod +x scripts/*.sh
./scripts/smoke.sh
```

The smoke flow will:
1. Wait for LocalStack to become ready.
2. Create the demo bucket.
3. Upload `sample.txt`.
4. Create the demo queue.
5. Send and receive a test message.
6. Verify the uploaded object exists.

## Cleanup
```bash
docker compose down -v
```

## CI pipeline
`.github/workflows/pipeline.yml` runs:
1. Docker Compose validation
2. LocalStack start
3. Smoke test execution
4. Log collection on failure
5. Teardown

## Branch flow
Development work happens on `dev`, then moves into `main` through a pull request.
