#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_sshserver.sh                                    :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+          
#   Created: 2021/02/04 12:58:10 by acesar-l          #+#    #+#             
#   Updated: 2021/03/01 13:00:41 by acesar-l         ###   ########.fr       
#                                                                            
# 

      SSH='/etc/ssh/sshd_config'
       IP=$(hostname -I | awk '{print $1}')

sudo systemctl enable ssh

sed -i 's/#Port 22/Port 4242/g'                  $SSH
sed -i 's/#PermitRootLogin/PermitRootLogin/g'    $SSH
sed -i 's/prohibit-password/no/g'                $SSH

sudo systemctl restart ssh

echo "Verify if the ssh_server is active:"
sudo service ssh status
ss -tunlp
echo "To connect via SSH from other terminal:"
echo ssh $USER@$IP -p 4242
