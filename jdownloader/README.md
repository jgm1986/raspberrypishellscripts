# JDownload Installation Script

The JDownload installation must do manually. Please use a Raspbian distribution with Pixel desktop environment.

## Requirements

These scripts has been customized for use an USB unit for JDownloader. This table shows the details associated to this:

 USB Drive   | Size*    | Mount Point        | Description
------------ | -------- | ------------------ | ----------------------------------------
*SDA1*       | 64 Gb    | /home/pi/Downloads | Used as JDownloader downloads directory.

*This is the size provisioned in my Raspberry Pi 2 for domestic use.


## Installation Steps
1. Attach the  USB storage device to the Raspberry Pi and check if the named assigned to them are correct according to the previous table. Use `lsblk` command for list all available devices.
 ```shell
pi@xxxxxx:~ $ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    1 59,6G  0 disk
└─sda1        8:1    1 59,6G  0 part 
mmcblk0     179:0    0 14,9G  0 disk
├─mmcblk0p2 179:2    0 14,8G  0 part /
└─mmcblk0p1 179:1    0 41,7M  0 part /boot
 ```
 **INFO:** You can customize the `usb-repository-format.sh` script for use your custom units.
 
2. Format and mount the units executting this command: `./usb-downloads-format.sh`
3. Download the JDownloader JAR file from the official site: http://jdownloader.org/download/index and put the **.jar** file inside `/home/pi/JDownloader` directory (must be created by the user). 
4. Launch for the first time the **.jar** file with this command: `java -jar JDownloader.jar`
5. Configure JDownloader with your custom parameters.
6. Insert the current line inside crontab: `@reboot java -jar /home/pi/JDownloader/JDownloader.jar`
