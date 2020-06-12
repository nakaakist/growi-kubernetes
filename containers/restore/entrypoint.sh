#!/bin/sh
{
  echo "[default]"
  echo "aws_access_key_id=$ACCESS_KEY_ID"
  echo "aws_secret_access_key=$SECRET_ACCESS_KEY"
} >> /root/.aws/credentials

aws s3 cp s3://$BUCKET_NAME/backup/$BACKUP_FILE ./
unzip $BACKUP_FILE
mongorestore -v --host $MONGO_HOST --db growi backup/growi
