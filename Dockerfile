# Dockerfile

# Use Ubuntu as the base image
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update \
    && apt-get install -y curl gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the shell script into the container
COPY devOpsMultTableTest.sh .

# Make the shell script executable
RUN chmod +x devOpsMultTableTest.sh

# Run the shell script when the container starts
CMD ["./devOpsMultTableTest.sh"]
