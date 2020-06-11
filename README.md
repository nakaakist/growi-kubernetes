# Kubernetes (Minikube) setup for Growi

## Setup
Run
```
kubectl apply -f ./setup/namespace.yml
```
to create a namespace "growi-prod."
Then, create a context by using your kubectl to use "growi-prod" namespace.

Rename ./setup/secrets.yml.sample to ./setup/secrets.yml, and edit the secrets.

Run
```
kubectl apply -f ./setup/secrets.yml
```
to register the secrets.

Run
```
kubectl apply -f ./app
```
to start the application.

You can access the Growi installation page at (external IP of crowi-service):30000 using your browser.

## Backup
To make backups of the database, run
```
kubectl apply -f ./jobs/backup.yml
```
This command creates a cron job which uploads a backup of the database to AWS S3 at 0:00 everyday.

To restore the database, run
```
kubectl run --rm -it restore --image nakaakist/restore-growi --env="ACCESS_KEY_ID=<your AWS access key ID for S3>" \
--env="SECRET_ACCESS_KEY=<your AWS secret access key for S3>" --env="BUCKET_NAME=<your S3 bucket name for Growi>" \
--env="BACKUP_FILE=<backup file name you want to use>" --env="MONGO_HOST=mongodb-service"
```

## If search function does not work
Try
```
kubectl apply -f ./jobs/reset-elasticsearch.yml
```
