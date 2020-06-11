#!/bin/sh
ES_IMAGE_NAME=elasticsearch-growi
BACKUP_IMAGE_NAME=backup-growi
RESTORE_IMAGE_NAME=restore-growi
MONGO_AWS_IMAGE_NAME=mongo-aws
RESET_ES_IMAGE_NAME=reset-elasticsearch-growi
REPOSITORY=nakaakist
docker image build -t ${ES_IMAGE_NAME} ./elasticsearch
docker image tag ${ES_IMAGE_NAME} ${REPOSITORY}/${ES_IMAGE_NAME}
docker image push ${REPOSITORY}/${ES_IMAGE_NAME}

docker image build -t ${MONGO_AWS_IMAGE_NAME} ./mongo-aws
docker image tag ${MONGO_AWS_IMAGE_NAME} ${REPOSITORY}/${MONGO_AWS_IMAGE_NAME}
docker image push ${REPOSITORY}/${MONGO_AWS_IMAGE_NAME}

docker image build -t ${BACKUP_IMAGE_NAME} ./backup
docker image tag ${BACKUP_IMAGE_NAME} ${REPOSITORY}/${BACKUP_IMAGE_NAME}
docker image push ${REPOSITORY}/${BACKUP_IMAGE_NAME}

docker image build -t ${RESTORE_IMAGE_NAME} ./restore
docker image tag ${RESTORE_IMAGE_NAME} ${REPOSITORY}/${RESTORE_IMAGE_NAME}
docker image push ${REPOSITORY}/${RESTORE_IMAGE_NAME}

docker image build -t ${RESET_ES_IMAGE_NAME} ./reset-elasticsearch
docker image tag ${RESET_ES_IMAGE_NAME} ${REPOSITORY}/${RESET_ES_IMAGE_NAME}
docker image push ${REPOSITORY}/${RESET_ES_IMAGE_NAME}
