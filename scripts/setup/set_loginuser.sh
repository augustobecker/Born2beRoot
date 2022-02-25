#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_loginuser.sh                                  :+:      :+:    :+:    
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/31 16:56:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/24 01:08:22 by acesar-l         ###   ########.fr       
#                                                                            
#

       GREEN="\033[0;32m"
         RED="\033[0;31m"
       RESET="\033[0m"
       
     LOGIN42=acesar-l
  LOGIN_USER=$(cat /etc/passwd | grep "$LOGIN42:" | wc -l)
LOGIN_GROUPS=$(groups $LOGIN42 | grep sudo | grep user42 | wc -l)
USER42_GROUP=$(getent group | grep user42: | wc -l)
 
if [ $LOGIN_USER == 0 ]
then
       sudo useradd -m -s /bin/bash $LOGIN42
fi

if [ $USER42_GROUP == 0 ]
then
       addgroup user42
fi

sudo usermod -aG user42      $LOGIN42
sudo usermod -aG sudo        $LOGIN42
sudo passwd  -n 2 -x 30 -w 7 $LOGIN42

if [ $LOGIN_GROUPS -ge 1]
then
       echo -e $GREEN$LOGIN42 is present and is a part of user42 and sudo groups. $RESET
else
       echo -e $RED"Something unexpected happened."$RESET
fi
