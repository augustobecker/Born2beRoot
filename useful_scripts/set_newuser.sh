#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_newuser.sh                                    :+:      :+:    :+:    
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/30 16:56:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/24 02:06:22 by acesar-l         ###   ########.fr       
#                                                                            
#

           GREEN="\033[0;32m"
	     RED="\033[0;31m"
           RESET="\033[0m"
      
        NEW_USER=$1
           GROUP=$2
      USER_CHECK=$(cat /etc/passwd | grep "$NEW_USER:" | wc -l)
     GROUP_CHECK=$(getent group | grep "$GROUP:" | wc -l)
USER_GROUP_CHECK=$(getent group | grep "$GROUP:" | grep ":$NEW_USER" | wc -l)

if [[-n $1 ]]
then
	if [ $USER_CHECK -ge 1 ]
	then
		echo $NEW_USER is present.
	else
		sudo useradd -m -s /bin/bash $NEW_USER
		sudo passwd -n 2 -x 30 -w 7  $NEW_USER
		echo -e $GREEN$NEW_USER was created. $RESET
	fi
else
	echo -e $RED"Please, specify an user."$RESET
fi

if [[-n $2 ]]
then
	if [ $GROUP_CHECK == 0 ]
	then
		sudo addgroup $GROUP
		echo -e $GREEN$GROUP was created. $RESET
	else
		echo $GROUP is present.
	fi
	if [ $USER_GROUP_CHECK == 0 ]
	then
		sudo usermod -aG $GROUP $NEW_USER
		echo -e $GREEN$NEW_USER is now part of $GROUP group. $RESET
	else
		echo $NEW_USER is already part of $GROUP group.
	fi
fi
