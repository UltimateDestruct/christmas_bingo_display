FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    git \
    unzip \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 22 and npm.
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code.
RUN npm install -g @anthropic-ai/claude-code

WORKDIR /var/www/html

CMD ["bash", "-lc", "sleep infinity"]
