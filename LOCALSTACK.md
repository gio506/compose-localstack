# What is LocalStack?

Think of LocalStack as a local stand-in for AWS services.

Instead of provisioning real cloud resources for every small change, you run LocalStack on your machine and point your tooling (like AWS CLI or SDKs) to `http://localhost:4566`.

## Why teams use it

- **Faster inner loop**: test changes quickly without waiting on remote infrastructure.
- **Cheaper experimentation**: no surprise cloud charges during local development.
- **Safer learning**: try ideas locally before touching shared environments.
- **Useful in CI**: good for smoke-level checks that prove your flow still works.

## How this repo uses it

This repo keeps things intentionally minimal:

- Only **S3** and **SQS** are enabled in `docker-compose.yml`.
- The scripts in `scripts/` call AWS CLI with a LocalStack endpoint.
- The smoke flow verifies a simple but realistic path:
  1. Create an S3 bucket and upload a file.
  2. Create an SQS queue, send a message, and receive one.

## Important caveat

LocalStack is excellent for local confidence, but it is still an emulator.
For production-critical paths, it is smart to run a final validation in a real AWS environment before release.
