##############################################################################
###                                                                         ##
##                                                       :::      ::::::::   #
#   set_hostname.sh                                    :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: acesar-l <acesar-l@student.42sp.org>       +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2022/01/30 15:56:19 by acesar-l          #+#    #+#             #
#   Updated: 2021/01/30 15:56:22 by acesar-l         ###   ########.fr      ##
##                                                                         ###
##############################################################################

#!/bin/bash
NEW_HOSTNAME=$1
cd /
echo $NEW_HOSTNAME > /etc/hostname
echo $NEW_HOSTNAME > /proc/sys/kernel/hostname

/etc/hosts

echo Hostname was changed to $NEW_HOSTNAME
