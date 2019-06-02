#!/bin/bash

. /etc/config-backup.conf

if [[ ! -d $temp_dir ]]; then
    mkdir $temp_dir;
fi

cd $working_dir

#Copy each monitored item recursively, force, and keep relative directory structure
for source in $sources; do
  cp -rfvp --parents "$source" $temp_dir
done

for backup_dir in $BackupDirs; do
  destination="${backup_dir}/${backup_name}_$(hostname)"
  if [ ! -d $destination ]; then
    mkdir $destination;
  fi
  rdiff-backup -v9 $temp_dir $destination
# use cp if you don't want to install rdiff-backup
# cp -rfvp --parents $temp_dir $destination
done

rm -rf $temp_dir

# Use rsync with to import the configs into a new system like:
# rsync -rva --progress --exclude "rdiff-backup-data" "$app_configs_source/" "$destination"

exit 0
