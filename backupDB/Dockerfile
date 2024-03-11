# Use a base image with the required tools
FROM postgres

# Set noninteractive mode for package installations
ENV DEBIAN_FRONTEND="noninteractive"

# Install dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client-16 awscli && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for database connection
ENV PGHOST="postgres.czimqpmzgn63.us-east-1.rds.amazonaws.com"
ENV PGPORT="5432"
ENV PGDATABASE="postgres"
ENV PGUSER="postgres"
ENV PGPASSWORD="postgres"

# Set AWS credentials (replace with your AWS credentials)
#ENV AWS_ACCESS_KEY_ID=""
#ENV AWS_SECRET_ACCESS_KEY=""
#ENV AWS_DEFAULT_REGION="us-east-1"
WORKDIR /backup
# Copy the backup script into the container
COPY . .

# Make the script executable
RUN chmod +x backup.sh

# Execute the backup script on container startup
CMD ["/backup.sh"]
