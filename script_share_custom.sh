#!/bin/bash
#Script to list the share name in storage to show its custom property
echo provide the name of the Storage with fqdn:
read stor
echo Listing out the Shares with the customer property
ssh $stor shares list > /home/rmanikpu/Proj_list
for i in `cat /home/rmanikpu/Proj_list`; 
		do 
			echo Projectname:$i
			ssh $stor shares select $i list > /home/rmanikpu/tmp_Share_list
			     cat /home/rmanikpu/tmp_Share_list | egrep -v 'Filesystems|NAME'|grep "\S"|awk {'print $1'} > /home/rmanikpu/Share_list
			 for j in `cat /home/rmanikpu/Share_list`;
			     do
			       echo Sharename:$j;ssh $stor shares select $i select $j show | grep custom; 
			     done
	    done
exit
