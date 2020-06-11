FROM mongo:3.6.3
RUN apt-get update && \
    apt-get install -y curl zip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    mkdir /root/.aws && \
    rm awscliv2.zip