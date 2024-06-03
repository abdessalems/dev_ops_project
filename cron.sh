#!/usr/bin/env bash

# This script sets up a cron job that runs a specific script every 5 minutes.
# The script that is run is `personnages.sh`, located in the current working directory.
# The cron job passes a timestamped directory name as an argument to `personnages.sh`.

# Update the package lists for upgrades and new package installations
sudo apt-get update

# Install the cron package
sudo apt-get install cron

# Start the cron service
sudo service cron start

# Check the status of the cron service
sudo service cron status

# Define the script path
# This is the path to the script that the cron job will run.
# It's set to `personnages.sh` in the current working directory.
SCRIPT_PATH="$(pwd)/personnages.sh"

# Define the date format
# This is the format of the timestamp that will be appended to the directory name.
# It includes the year, month, day, hour, and minute.
DATE_FORMAT="\$(date +\%Y-\%m-\%d-\%H-\%M)"

# Define the crontab entry
# This is the cron job that will be added to the crontab.
# It runs the `personnages.sh` script every 5 minutes, passing a timestamped directory name as an argument.
CRON_ENTRY="*/5 * * * * /bin/bash $SCRIPT_PATH $HOME/personnages-$DATE_FORMAT"

# Add the entry to crontab
# This command adds the defined cron job to the crontab.
# It first lists the existing crontab entries, then appends the new entry, and finally installs the new crontab.
(crontab -l; echo "$CRON_ENTRY" ) | crontab -