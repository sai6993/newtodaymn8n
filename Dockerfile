FROM n8nio/n8n:latest

USER root

# Install Docker CLI, curl, openssl, helm
RUN apk update && \
    apk add --no-cache bash curl docker-cli openssl && \
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    mkdir -p /home/node/.local/bin && \
    ln -s /usr/local/bin/helm /home/node/.local/bin/helm && \
    chown -R node:node /home/node/.local && \
    rm -rf /var/cache/apk/*

# Add helm path to ENV for node user
ENV PATH="/home/node/.local/bin:$PATH"

USER node

