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

**Note:** During the installation process, select *Internet Site* in *Postfix Configuration*.
 
4. Edit the file `gitlab.rb` with your custom configuration requirements. Next, launch the `./gitlab-copy-config.sh` script.
5. Finally, execute this command: `sudo gitlab-ctl reconfigure`


## Restore a GitLab Backup file.

The restore process requires the same GitLab version installed on the system. If not, an error like this is shown:
```
GitLab version mismatch:
  Your current GitLab version (9.2.5) differs from the GitLab version in the backup!
  Please switch to the following version and try again:
  version: 9.0.1
```

**Note:** Older GitLab versions are available here: https://packages.gitlab.com/gitlab/gitlab-ce

1. Install the same version of your backup file. Example:
 ```bash
curl -s https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce=9.0.1-ce.0
 ```
2. Copy the backup file inside GitLab backup folder.
3. Restore it using this command:
 ```bash
sudo gitlab-rake gitlab:backup:restore BACKUP=1490905817_2017_03_30
 ```
 **Note:** The configuration file name is `1490905817_2017_03_30_gitlab_backup.tar`.

4. Upgrade your GitLab installation to the last version available with:
  ```bash
 sudo apt-get update
 sudo apt-get upgrade -y
  ```

## Enable import projects from Gitlab.com

Follow the next steps:

1. Login into your Gitlab.com account.
2. Navigate to: `Applications`
3. Fill the name wit: `GitLab CE`
4. Enter the next value in `Redirect URI`
```
http://192.168.100.252/import/gitlab/callback
http://192.168.100.252/users/auth/gitlab/callback
```
5. Mark all check boxes:
    - [x] api Access your API 
    - [x] read_user Read user information 
    - [x] read_registry Read Registry 
    - [x] openid Authenticate using OpenID Connect 
6. Click the `Save application` button and customize your `gitlab.rb` file with the **Application Id** and **Secret** values.
