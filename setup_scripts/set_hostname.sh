#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   set_hostname.sh                                 :+:      :+:    :+:      
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/30 16:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/01/30 16:24:22 by acesar-l         ###   ########.fr       
#                                                                            
#

NEW_HOSTNAME=$1

cd /
sed -i "s/$HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
echo $NEW_HOSTNAME > /etc/hostname
echo $NEW_HOSTNAME > /proc/sys/kernel/hostname
echo Hostname was changed to $NEW_HOSTNAME
