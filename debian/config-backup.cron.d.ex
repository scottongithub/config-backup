#
# Regular cron jobs for the config-backup package
#
0 4	* * *	root	[ -x /usr/bin/config-backup_maintenance ] && /usr/bin/config-backup_maintenance
