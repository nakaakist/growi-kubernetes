# AWS access key ID, secret access key, S3 bucket name, and host name of the target mongodb
# are given as environmental variables ACCESS_KEY_ID, SECRET_ACCESS_KEY, BUCKET_NAME, and MONGO_HOST
FROM nakaakist/mongo-aws
COPY ./entrypoint.sh /
ENTRYPOINT ["bin/sh", "/entrypoint.sh"]