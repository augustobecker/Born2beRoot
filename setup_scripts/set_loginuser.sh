#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_loginuser.sh                                  :+:      :+:    :+:    
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/31 16:56:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/08 16:48:22 by acesar-l         ###   ########.fr       
#                                                                            
#

     LOGIN42=acesar-l
  LOGIN_USER=$(cat /etc/passwd | grep acesar-l: | wc -l)
LOGIN_GROUPS=$(groups acesar-l | grep sudo | grep user42)
 CREATE_USER=$(sudo useradd -m -s /bin/bash $LOGIN42)
USER42_GROUP=$(getent group | grep user42: | wc -l)
 
if [ $LOGIN_USER -ge 1 ]; then $CREATE_USER; fi)
if [ $USER42_GROUP -ge 1 ]; then addgroup user42; fi)
sudo usermod -aG user42 $LOGIN42
sudo usermod -aG sudo $LOGIN42

sudo passwd -n 2 -x 30 -w 7 $LOGIN42

echo $LOGIN42 is present and is a part of user42 and sudo groups.
