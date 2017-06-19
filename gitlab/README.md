# GitLab Installation Scripts 

This folder contains all necessary to install automatically a GitLab instance.

## Requirements

These scripts has been customized for use two USB drivers for GitLab. This table shows the details associated to them:

 USB Drive   | Size*    | Mount Point     | Description
------------ | -------- | --------------- | -----------------------------------
*SDA1*       | 32 Gb    | /home/pi/backup | Used as GitLab backup unit.
*SDB1*       | 128 Gb   | /home/pi/gitlab | GitLab repositories storage.

*This is the size provisioned in my Raspberry Pi 2 for domestic use.


## Installation Steps
1. Attach the  USB storage devices to the Raspberry Pi and check if the named assigned to them are correct according to the previous table. Use `lsblk` command for list all devices.
 ```shell
pi@xxxxxx:~ $ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sdb           8:16   1 119.3G  0 disk
└─sdb1        8:17   1 119.3G  0 part 
sdc           8:32   1  59.6G  0 disk
└─sdc1        8:33   1  59.6G  0 part
sda           8:0    1  29.8G  0 disk
└─sda1        8:1    1  29.8G  0 part 
mmcblk0     179:0    0  14.9G  0 disk
├─mmcblk0p2 179:2    0  14.8G  0 part /
└─mmcblk0p1 179:1    0    41M  0 part /boot
 ```
 **INFO:** You can customize the `usb-repository-format.sh` script for use your custom units.
 
2. Format and mount the units executting this command: `./usb-repository-format.sh`
3. Install GitLab with this: `./gitlab-installer.sh`
4. Edit the file `gitlab.rb` with your custom configuration requirements. Next, launch the `./gitlab-copy-config.sh` script.
5. Finally, execute this command: `sudo gitlab-ctl reconfigure`


## Restore a GitLab Backup file.
