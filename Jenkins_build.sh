#!/bin/bash

# Define the project directory and log file
PROJECT_DIR="/var/jenkins_home/workspace/my_project"
LOG_FILE="$PROJECT_DIR/build.log"

# Move to the project directory
cd $PROJECT_DIR || { echo "Project directory not found!"; exit 1; }

# Pull the latest code from the Git repository
echo "Pulling the latest code from the repository..." >> $LOG_FILE
git pull origin main >> $LOG_FILE 2>&1

# Check if the git pull command was successful
if [ $? -ne 0 ]; then
  echo "Error pulling the latest code!" >> $LOG_FILE
  exit 1
fi

# Print success message
echo "Successfully pulled the latest code from the repository." >> $LOG_FILE

# Exit script with success status
exit 0
