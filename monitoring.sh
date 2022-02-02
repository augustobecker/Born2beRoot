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

DATE=`(date +'%a %b %d %T %Y')`
ARCHITECTURE=`(uname -a)`
PHYSICAL_CPU=`(grep "physical id" /proc/cpuinfo | sort -u | wc -l)`
VIRTUAL_CPU=`(grep "processor" /proc/cpuinfo | sort -u | wc -l)`
LAST_BOOT=`(who -b | head -n 1 | awk '{ print $3, $4}')`
IP_ADDRESS=`(sudo ifconfig | grep 'broadcast' | awk '{ print $2 }')`
MAC_ADDRESS=`(sudo ifconfig | grep 'ether' | awk '{ print $2 }')`
LVM_USE=`(grep "/dev/mapper" /etc/fstab | wc -l)`
COMMANDS_EXECUTED=`(grep "COMMAND=" /var/log/sudo/sudo.log | wc -l)`

echo "Broadcast message from root@$HOSTNAME (tty1)" \($DATE\)
echo "  #Architecture: "$ARCHITECTURE
echo "  #CPU Physical: "$PHYSICAL_CPU
echo "  #vCPU: "$VIRTUAL_CPU
echo "  #Memory Usage: "
echo "  #Disk Usage: "
echo "  #CPU load: "
echo "  #Last boot: "$LAST_BOOT

if [[ $LVM_USE -ge 1 ]]
then
echo "  #LVM use: yes"
else
echo "  #LVM use: no"
fi

echo "  #Connexions TCP: "
echo "  #User log: "
echo "  #Network: IP "$IP_ADDRESS \($MAC_ADDRESS\)
echo "  #Sudo: "$COMMANDS_EXECUTED cmd
