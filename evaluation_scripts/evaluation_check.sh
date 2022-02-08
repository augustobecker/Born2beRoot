#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   evaluation_check.sh                                :+:      :+:    :+:      
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/02/08 16:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/08 16:24:22 by acesar-l         ###   ########.fr       
#                                                                            
#
         PAM='/etc/pam.d/common-password'
        FILE='/etc/login.defs'
         LVM=$(lsblk | grep lvm | wc -l)
  LOGIN_USER=$(cat /etc/passwd | grep acesar-l)
LOGIN_GROUPS=$(groups acesar-l | grep sudo | grep user42)
 USER_POLICY=$(sed -n '160 p; 161 p; 162 p' $FILE | paste -s -d ',' | sed 's/,/, /g')
   CHECK_PAM=$(sed -n '25 p' $PAM | awk '{ print $4, $5, $6, $7, $8, $9, $10, $11}')
 
echo "1. Check if there's at least 2 encrypted partitions using LVM:"
echo "1. Partitions = "$LVM

echo "2. Check if the hostname of the virtual machine is my login ending
with 42 (acesar-l42):"
echo "2. hostname: "$HOSTNAME

echo "3. A user with my login (acesar-l) as username has to be present"
echo "   and belong to the user42 and sudo groups:"
echo "3. user = $LOGIN_USER"
echo " groups = $LOGIN_GROUPS"
echo "4. Check if a strong password policy was implemented:"

chage -l acesar-l

$CHECK_PAM
$USER POLICY
