#!/bin/bash

# Define the crontab entry
CRON_ENTRY="*/5 * * * * /bin/bash /path/to/your/script.sh /root/folder/\$(date +\%Y-\%m-\%d)"

# Add the entry to crontab
(crontab -l; echo "$CRON_ENTRY" ) | crontab -