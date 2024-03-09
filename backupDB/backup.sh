#!/bin/bash

# Connect to PostgreSQL and run backup command
pg_dump -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -Fc -f /backup.dump

# Check the exit status of the pg_dump command
if [ $? -eq 0 ]; then
    echo "PostgreSQL backup completed successfully."

    # Upload the backup to S3 bucket using AWS CLI
    aws s3 cp /backup.dump s3://catchup-session/dylan/backup_$(date +"%Y%m%d%H%M%S").dump

    # Check the exit status of the aws s3 cp command
    if [ $? -eq 0 ]; then
        echo "Backup uploaded to S3 successfully."
    else
        echo "Error: Failed to upload backup to S3."
    fi

    # Remove the local backup file
    rm /backup.dump
else
    echo "Error: PostgreSQL backup failed."
fi
