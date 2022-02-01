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

LAST_BOOT=`(who -b | head -n 1 | awk '{ print $3, $4}')`
PHYSICAL_CPU=`(grep "physical id" /proc/cpuinfo | sort -u | wc -l)`
VIRTUAL_CPU=`(grep "processor" /proc/cpuinfo | sort -u | wc -l)`
IP_ADDRESS=`(sudo ifconfig | grep 'broadcast' | awk '{ print $2 }')`
MAC_ADDRESS=`(sudo ifconfig | grep 'ether' | awk '{ print $2 }')`

echo "Broadcast message from root@$HOSTNAME (tty1)" \($DATE\)
echo "  #Architecture:   "
echo "  #CPU Physical: "$PHYSICAL_CPU
echo "  #vCPU: "$VIRTUAL_CPU
echo "  #Memory Usage:   "
echo "  #Disk Usage:     "
echo "  #CPU load:       "
echo "  #Last boot: "$LAST_BOOT
echo "  #LVM use:        "
echo "  #Connexions TCP: "
echo "  #User log:       "
echo "  #Network: IP "$IP_ADDRESS \($MAC_ADDRESS\)
echo "  #Sudo:            "
