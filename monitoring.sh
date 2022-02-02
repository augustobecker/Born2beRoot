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

CRON=`(find . \( -type f -name job_scheduler\) | wc -l)`
PWD=`(pwd)`

INFO=monitoring.txt

ARCHITECTURE=`(uname -a)`
PHYSICAL_CPU=`(grep "physical id" /proc/cpuinfo | sort -u | wc -l)`
VIRTUAL_CPU=`(grep "processor" /proc/cpuinfo | sort -u | wc -l)`
LAST_BOOT=`(who -b | head -n 1 | awk '{ print $3, $4}')`
IP_ADDRESS=`(sudo ifconfig | grep 'broadcast' | awk '{ print $2 }')`
MAC_ADDRESS=`(sudo ifconfig | grep 'ether' | awk '{ print $2 }')`
LVM_USE=`(grep "/dev/mapper" /etc/fstab | wc -l)`
COMMANDS_EXECUTED=`(grep "COMMAND=" /var/log/sudo/sudo.log | wc -l)`

if [[ $CRON -ge 1 ]]
then
touch job_scheduler
echo "*/10 * * * * "$PWD"/monitoring.sh"
fi

touch INFO

echo "  #Architecture: "$ARCHITECTURE >> $INFO
echo "  #CPU Physical: "$PHYSICAL_CPU >> $INFO
echo "  #vCPU: "$VIRTUAL_CPU >> $INFO
echo "  #Memory Usage: " >> $INFO
echo "  #Disk Usage: " >> $INFO
echo "  #CPU load: " >> $INFO
echo "  #Last boot: "$LAST_BOOT >> $INFO

if [[ $LVM_USE -ge 1 ]]
then
echo "  #LVM use: yes" >> $INFO
else
echo "  #LVM use: no" >> $INFO
fi

echo "  #Connexions TCP: " >> $INFO
echo "  #User log: " >> $INFO
echo "  #Network: IP "$IP_ADDRESS \($MAC_ADDRESS\) >> $INFO
echo "  #Sudo: "$COMMANDS_EXECUTED cmd >> $INFO

wall INFO

rm INFO
