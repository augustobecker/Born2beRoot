#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   hostname.sh                                        :+:      :+:    :+:      
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/30 16:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/19 16:54:22 by acesar-l         ###   ########.fr       
#                                                                            
#

NEW_HOSTNAME=$1

GREEN="\033[0;32m"
RESET="\033[0m"

cd /
sed -i "s/$HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
echo $NEW_HOSTNAME > /etc/hostname
echo $NEW_HOSTNAME > /proc/sys/kernel/hostname
echo -e $GREEN"Hostname was changed to "$NEW_HOSTNAME $RESET
