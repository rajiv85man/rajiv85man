#!/bin/bash
#Script to take the backup of /etc/fstab, comment the decommission project entry and then umount all the required shares
echo provide the name of the project for which shares are being decommissioned :
read project
echo Current output of the fstab...
cat /etc/fstab | grep $project
echo Taking Backup of fstab entry....
cp /etc/fstab /etc/fstab_$(date +%d%B%y)
echo Commenting the required entry in fstab....
sed -i  '/[/]'$project'/ s/^/#/' /etc/fstab
sleep 10
echo Current output of the fstab...
cat /etc/fstab | grep $project
echo Below shares will be unmounted
df -hP | grep $project
sleep 10
echo Unmounting the shares...
df -hP  | grep $project | awk '{print $6}' | xargs > /home/rmanikpu/output.txt
umount -l `cat /home/rmanikpu/output.txt`
echo It is done:
df -hP | grep $project
exit
