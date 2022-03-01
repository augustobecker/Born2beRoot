#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   set_firewall.sh                                    :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/02/07 12:23:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/07 12:25:22 by acesar-l         ###   ########.fr       
#                                                                            
#

PORT="4242"

sudo ufw enable
systemctl enable ufw
sudo ufw allow {PORT}
sudo ufw status
