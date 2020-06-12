#!/bin/sh
{
  echo "[default]"
  echo "aws_access_key_id=$ACCESS_KEY_ID"
  echo "aws_secret_access_key=$SECRET_ACCESS_KEY"
} >> /root/.aws/credentials
mongodump --host $MONGO_HOST --db growi --out /backup

BACKUP_FILE=`date "+%Y%m%d-%H%M%S.zip"`

zip -r  $BACKUP_FILE /backup
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/backup/
