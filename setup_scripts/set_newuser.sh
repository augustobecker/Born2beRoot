#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_newuser.sh                                    :+:      :+:    :+:    
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/30 16:56:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/08 17:06:22 by acesar-l         ###   ########.fr       
#                                                                            
#

   NEW_USER=$1
      GROUP=$2
GROUP_CHECK=$(getent group | grep "$GROUP:" | wc -l)

sudo useradd -m -s /bin/bash $NEW_USER
if [ $GROUP_CHECK -ge 1 ]; then sudo addgroup $GROUP; fi
sudo usermod -aG $GROUP $NEW_USER
sudo passwd -n 2 -x 30 -w 7 $NEW_USER

echo $NEW_USER was created and added to $GROUP group.
