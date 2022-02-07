#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_sshserver.sh                                    :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+          
#   Created: 2021/02/04 12:58:10 by acesar-l          #+#    #+#             
#   Updated: 2021/02/04 13:00:41 by acesar-l         ###   ########.fr       
#                                                                            
# 

      SSH='/etc/ssh/sshd_config'
  NETWORK='/etc/network/interfaces'

      IP=$(ip addr show | awk '{print $2}' | sed -n '9p')
NET_MASK=$()
 GATEWAY=$()
 
BROADCAST=$(ip addr show | awk '{print $4}' | sed -n '9p')

sed -i 's/#Port 22/Port 4242/' $SSH
sed -i 's/#PermitRootLogin/PermitRootLogin/' $SSH
sed -i 's/prohibit-password/no/' $SSH

echo "Verify if the ssh_server is active:"
sudo service ssh status
echo "To connect via SSH from other terminal:"
echo ssh $USER@$IP -p 4242

sed -i '12 s/dhcp/static/g' $NETWORK
echo address $IP >> $NETWORK
echo netmask $NET_MASK >> $NETWORK
echo gateway $GATEWAY >> $NETWORK
