#!/bin/bash

/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home/pi" "gdrive:PiBackup"

"""
This script runs my backup process. It copies the contents of /home/pi to PiBackup on gdrive, my Google Drive. Here's what the terms mean:

Copy - copy files from Pi to gdrive. It skips files that are already present on gdrive.
--Update - Skip any files that haven't been updated since the last backup.
--verbose - Give info about every file that's transferred.
--transfers 30 - Number of files to copy in parallel.
--checkers 8 - Monitors the transfers that are in progress.
--contimeout 60 - Connection timeout. rclone will attempt connection to remote storage for 60s.
--timeout 300s - Connection times out if the transfer is idle for this long.
--retries 3 - Copy action restarts after this number of errors.
--low-level-retries 10 - Tries to repeat low-level failing operations, e.g. a single HTTP request.
--stats 1s - rclone gives update on file transfers every second.
/home/pi - The local directory that we're copying to gdrive.
gdrive:PiBackup - The destination directory. Here, it's saving to my PiBackup directory on gdrive.
"""