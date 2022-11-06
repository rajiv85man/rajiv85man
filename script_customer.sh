#!/bin/bash
#Script to list the project name in storage to show its custom property
echo provide the name of the Storage with fqdn:
read stor
echo Listing out the project with the customer property
ssh $stor shares list > /home/rmanikpu/Proj_list
for i in `cat /home/rmanikpu/Proj_list`; do echo Project Name:$i;ssh $stor shares select $i show | grep custom; done
exit
