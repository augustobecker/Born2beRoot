#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   evaluation.sh                                      :+:      :+:    :+:      
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/02/08 16:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/24 11:42:22 by acesar-l         ###   ########.fr       
#                                                                            
#

           GREEN="\033[0;32m"
             RED="\033[0;31m"
           RESET="\033[0m"

             LVM=$(lsblk | grep lvm | wc -l)
      LOGIN_USER=$(cat /etc/passwd | grep acesar-l)
    LOGIN_GROUPS=$(groups acesar-l | grep sudo | grep user42)
USER_GROUP_CHECK=$(groups acesar-l | grep user42 | grep sudo | wc -l)
 
if [ ${LVM} -ge 2 ]
then 
       echo -e "Partitions:       ${GREEN}[OK]${RESET}"
else
       echo -e "Partitions:       ${RED}[KO]${RESET}"
fi

if  [[ "${HOSTNAME}" == "acesar-l42" ]]
then
       echo -e "Hostname login42: ${GREEN}[OK]${RESET}"
else
       echo -e "Hostname login42: ${RED}[KO]${RESET}"
fi

if [ $USER_GROUP_CHECK == 0 ]
then
	echo -e "User login42:     ${RED}[KO]${RESET}"
else
	echo -e "User login42:     ${GREEN}[OK]${RESET}"
fi
