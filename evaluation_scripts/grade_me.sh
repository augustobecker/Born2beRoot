#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   grade_me.sh                                     :+:      :+:    :+:      
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/31 16:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/01/31 16:24:22 by acesar-l         ###   ########.fr       
#                                                                            
#

echo "1. Check if there's at least 2 encrypted partitions using LVM:"

lsblk

echo "1. OK"
echo "2. Check if the hostname of the virtual machine is my login ending
with 42 (acesar-l42):"

hostname

echo "2. Done :)"
echo "3. I have to modify this hostname during the evaluation:"

../setup_scripts/set_hostname.sh Becker42

echo "3. OK, right?"
echo "4. Now, I have to create a new user and assign it to a group"
echo "I'll create a user called becker and assign it to friends group"

../setup_scripts/set_newuser.sh becker

echo "4. OK"
echo "5. Check if a strong password policy was implemented:"

chage -l acesar-l

grep pam_cracklib.so /etc/pam.d/common-password

echo "5. OK? You can try on your own!"
