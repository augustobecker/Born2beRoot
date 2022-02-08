#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   requirements.sh                                    :+:      :+:    :+:  
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+          
#   Created: 2021/02/01 18:58:10 by acesar-l          #+#    #+#             
#   Updated: 2021/02/01 19:00:41 by acesar-l         ###   ########.fr       
#                                                                            
# 

head -n 2 /etc/os-release
/usr/sbin/aa-status
ss -tunip
/usr/sbin/ufw status
