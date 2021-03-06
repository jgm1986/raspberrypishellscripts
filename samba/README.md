# Samba Installation Script

## General

The current script is used for share the JDownloader downloads directory (/home/pi/Descargas)
with my computers using Samba. This script generate 2 shared folder.

Install
------
1) First at all, you must modify the "samba_install.sh" script with your own parameters.
   Next, launch the installation script: ./samba_install.sh

2) If you want hide the home Pi user directory, you must modify the samba config file.
   Use this command for edit it manually: sudo nano /etc/samba/smb.conf

3) Comment the "[home]" block using ";" symbol for uncomment lines.
   The "smb.conf" file will be similar than:
```
	#======================= Share Definitions =======================

	;[homes]
	;   comment = Home Directories
	;   browseable = no

	# By default, the home directories are exported read-only. Change the
	# next parameter to 'no' if you want to be able to write to them.
	;   read only = yes

	# File creation mask is set to 0700 for security reasons. If you want to
	# create files with group=rw permissions, set next parameter to 0775.
	;   create mask = 0700

	# Directory creation mask is set to 0700 for security reasons. If you want to
	# create dirs. with group=rw permissions, set next parameter to 0775.
	;   directory mask = 0700

	# By default, \\server\username shares can be connected to by anyone
	# with access to the samba server.
	# The following parameter makes sure that only "username" can connect
	# to \\server\username
	# This might need tweaking when using external authentication schemes
	;   valid users = %S
```
4) Restart Samba with this command: sudo /etc/init.d/samba restart

Enjoy!
