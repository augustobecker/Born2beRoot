#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   monitoring.sh                                      :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+          
#   Created: 2021/02/01 16:58:10 by acesar-l          #+#    #+#             
#   Updated: 2021/02/01 17:00:41 by acesar-l         ###   ########.fr       
#                                                                            
# 

             CRON=$(find . -type f -name job_scheduler | wc -l)
              PWD=$(pwd)
     ARCHITECTURE=$(uname -a)
     PHYSICAL_CPU=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
      VIRTUAL_CPU=$(grep "processor" /proc/cpuinfo | sort -u | wc -l)
        LAST_BOOT=$(who -b | head -n 1 | awk '{ print $3, $4}')
       IP_ADDRESS=$(sudo ifconfig | grep 'broadcast' | awk '{ print $2 }')
      MAC_ADDRESS=$(sudo ifconfig | grep 'ether' | awk '{ print $2 }')
              LVM=$(grep "/dev/mapper" /etc/fstab | wc -l)
          LVM_USE=$(if [ $LVM -ge 1 ]; then echo yes; else echo no; fi)
COMMANDS_EXECUTED=$(grep "COMMAND=" /var/log/sudo/sudo.log | wc -l)

if [[ $CRON -eq 0 ]]
then
touch job_scheduler
crontab job_scheduler
echo "*/10 * * * * "$PWD"/monitoring.sh" >> job_scheduler
fi

wall " #Architecture: $ARCHITECTURE
#CPU Physical: $PHYSICAL_CPU
#vCPU: $VIRTUAL_CPU
#Memory Usage:
#Disk Usage:
#CPU load:
#Last boot: $LAST_BOOT
#LVM use: $LVM_USE
#Connexions TCP:
#User log:
#Network: IP $IP_ADDRESS \($MAC_ADDRESS\)
#Sudo: $COMMANDS_EXECUTED cmd"
