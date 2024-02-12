# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package lists and install essential tools
RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    apt-get clean

# Install Node.js 14
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Install Node.js 16
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Install Node.js 18
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Set working directory
WORKDIR /app

# Copy the shell script into the container
COPY devOpsMultTableTest.sh /app/

# Set execute permission for the shell script
RUN chmod +x /app/devOpsMultTableTest.sh

# Run the shell script
CMD ["/app/devOpsMultTableTest.sh"]