FROM node:14-bullseye

# Set working directory
WORKDIR /app

# Install system dependencies (Java for Karma, Chromium/Firefox for headless tests, Ruby for Jekyll)
RUN apt-get update -y && \
    apt-get install -y \
        openjdk-11-jre \
        chromium \
        ruby-full \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install required Ruby gems (lock to versions Bootstrap 3 used)
RUN gem install public_suffix -v 3.0.3 \
    && gem install ffi -v 1.9.25 \
    && gem install bundler -v 1.17.3 \
    && gem install jekyll -v 3.5.0

# Install global Node build/test tools
RUN npm install -g \
    grunt-cli \
    karma \
    qunit \
    karma-qunit \
    karma-chrome-launcher \
    karma-firefox-launcher \
    karma-detect-browsers
