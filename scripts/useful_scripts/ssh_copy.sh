#!/bin/bash

#
#                                                                            
#                                                        :::      ::::::::   
#   ssh_copy.sh                                         :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+          
#   Created: 2021/04/27 20:29:10 by acesar-l          #+#    #+#             
#   Updated: 2021/04/27 20:29:41 by acesar-l         ###   ########.fr       
#                                                                            
# 

  IP=$(hostname -I | awk '{ print $1 }')
PORT="4242"

echo scp -P ${PORT} filename $USER@$IP:newfilepath
