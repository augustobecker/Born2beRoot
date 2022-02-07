#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   ssh_connect.sh                                      :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+          
#   Created: 2021/02/04 12:58:10 by acesar-l          #+#    #+#             
#   Updated: 2021/02/04 13:00:41 by acesar-l         ###   ########.fr       
#                                                                            
# 

  IP=`(ip addr show | awk '{print $2}' | sed -n '9p')`
PORT="4242"

echo ssh $USER@$IP -p $PORT
