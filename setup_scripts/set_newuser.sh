#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_newuser.sh                                    :+:      :+:    :+:    
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/30 16:56:19 by acesar-l          #+#    #+#             
#   Updated: 2022/01/30 16:56:22 by acesar-l         ###   ########.fr       
#                                                                            
#

NEW_USER=$1

cd /
sudo useradd -m -s /bin/bash $NEW_USER
sudo addgroup friends
sudo usermod -aG friends $NEW_USER
sudo passwd -n 2 -x 30 -w 7 $NEW_USER

echo $NEW_USER was created and added to friends group.
echo "A strong password policy was set to the user."
