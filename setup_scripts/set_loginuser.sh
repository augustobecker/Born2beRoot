#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   set_loginuser.sh                                  :+:      :+:    :+:    
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/31 16:56:19 by acesar-l          #+#    #+#             
#   Updated: 2022/01/31 16:56:22 by acesar-l         ###   ########.fr       
#                                                                            
#

LOGIN42=acesar-l

sudo addgroup user42
sudo usermod -aG user42 $LOGIN42
sudo usermod -aG sudo $LOGIN42
sudo passwd -n 2 -x 30 -w 7 $LOGIN42

echo $LOGIN42 is present and is a part of user42 and sudo groups.
