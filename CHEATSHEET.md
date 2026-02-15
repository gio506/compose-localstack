# Quick Cheatsheet

## Start / stop
```bash
docker compose up -d
docker compose down -v
```

## Run all checks
```bash
chmod +x scripts/*.sh
./scripts/smoke.sh
```

## Run one script
```bash
./scripts/01-create-bucket.sh
./scripts/02-upload-sample.sh
./scripts/03-create-queue.sh
./scripts/04-send-receive-message.sh
```

## Logs
```bash
docker compose logs -f localstack
```

## Why this file?
Use this file as a one-page command reminder for local setup and demos.
