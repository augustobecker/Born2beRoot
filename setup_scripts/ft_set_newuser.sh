##############################################################################
#                                                                            #
#                                                        :::      ::::::::   #
#   set_newuser.sh                                    :+:      :+:    :+:    #
#                                                    +:+ +:+         +:+     #
#   By: acesar-l <acesar-l@student.42sp.org.br>    +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2022/01/30 16:56:19 by acesar-l          #+#    #+#             #
#   Updated: 2022/01/30 16:56:22 by acesar-l         ###   ########.fr       #
#                                                                            #
##############################################################################

#!/bin/bash
NEW_USER=$1
cd /
sudo useradd -m -s /bin/bash $NEW_USER
sudo addgroup user42
sudo usermod -aG sudo $NEW_USER
sudo usermod -aG user42 $NEW_USER
sudo passwd -n 2 -x 30 -w 7 $NEW_USER
echo $NEW_USER was created and added to sudo and user42 groups.
echo A strong password policy was 'set' to the user.
