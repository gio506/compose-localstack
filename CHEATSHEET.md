# compose-localstack Cheatsheet

## Start and stop
```bash
docker compose up -d
docker compose down -v
```

## Run the smoke test
```bash
chmod +x scripts/*.sh
./scripts/smoke.sh
```

## Inspect LocalStack
```bash
docker compose ps
docker compose logs localstack
docker compose exec -T localstack awslocal s3 ls
docker compose exec -T localstack awslocal sqs list-queues
```

## Run one script at a time
```bash
./scripts/01-create-bucket.sh
./scripts/02-upload-sample.sh
./scripts/03-create-queue.sh
./scripts/04-send-receive-message.sh
```

## Useful overrides
```bash
BUCKET_NAME=my-bucket ./scripts/01-create-bucket.sh
QUEUE_NAME=my-queue ./scripts/03-create-queue.sh
MESSAGE_BODY="hello" ./scripts/04-send-receive-message.sh
```

## Git flow
```bash
git switch dev
git pull origin main
git status
```
