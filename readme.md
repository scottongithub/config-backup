# Overview
Bash script that copies specified files/directories to a specified destination, copying directory structure relative to a specified directory. It was created with the intention of sending individual application configurations, in their not-so-standardized locations, to a backup/exports directory.

# Prerequisites
rdiff-backup, though cp/rsync can be substituted

# Usage
Edit the config file, `config-backup.conf`, with sources, destination, and working directory. Then run `config-backup.sh`.

All files and directories will keep their paths relative to the working directory. Timestamps, mode, owner is preserved.

There is a commented-out command in the script for later importing the configs to a new system, using rsync, excluding rdiff-backup-data and keeping parent structure.

# License
GPLv3
