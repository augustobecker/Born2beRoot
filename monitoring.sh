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
              
 ARCHITECTURE=$(uname -a)
 PHYSICAL_CPU=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
  VIRTUAL_CPU=$(grep "processor" /proc/cpuinfo | sort -u | wc -l)
  MEMORY_USED=$(free -m | grep "Mem:" | awk '{ print $3 }')
 MEMORY_TOTAL=$(free -m | grep "Mem:" | awk '{ print $2 }')
 MEMORY_PERCN=$(free -m | grep "Mem:" | awk '{ printf("%.2f"), $3/$2*100 }')
    DISK_USED=$(df -m --total | grep "total" | awk '{ print $3 }')
   DISK_TOTAL=$(df --total -BG | grep "total" | awk '{ print $2 }')
  DISK_PERCNT=$(df -m --total | grep "total" | awk '{ print $5 }')
     CPU_LOAD=$()
    LAST_BOOT=$(who -b | head -n 1 | awk '{ print $3, $4}')
          LVM=$(lsblk | grep "lvm" | wc -l)
      LVM_USE=$(if [ $LVM -ge 1 ]; then echo yes; else echo no; fi)
     TCP_CONX=$(netstat -nat | grep ESTABLISHED | wc -l)
     USER_LOG=$(users | wc -w)
   IP_ADDRESS=$(hostname -I | awk '{ print $1 }')
  MAC_ADDRESS=$(sudo ifconfig | grep 'ether' | awk '{ print $2 }')
COMMANDS_EXEC=$(grep "COMMAND=" /var/log/sudo/sudo.log | wc -l)

wall "	#Architecture: $ARCHITECTURE
	#CPU Physical: $PHYSICAL_CPU
	#vCPU: $VIRTUAL_CPU
	#Memory Usage: $MEMORY_USED/${MEMORY_TOTAL}MB ($MEMORY_PERCN%)
	#Disk Usage: $DISK_USED/${DISK_TOTAL}b ($DISK_PERCNT)
	#CPU load: $CPU_LOAD
	#Last boot: $LAST_BOOT
	#LVM use: $LVM_USE
	#Connexions TCP: $TCP_CONX ESTABLISHED
	#User log: $USER_LOG
	#Network: IP $IP_ADDRESS ($MAC_ADDRESS)
	#Sudo: $COMMANDS_EXECUTED cmd"
