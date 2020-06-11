FROM alpine
RUN apk update && apk --update add curl
ENV ES_HOST=elasticsearch-service
CMD curl -XDELETE http://${ES_HOST}:9200/crowi-current?pretty=true