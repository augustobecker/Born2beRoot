##############################################################################
#                                                                            #
#                                                       :::      ::::::::    #
#   evaluation.sh                                 :+:      :+:    :+:      #
#                                                    +:+ +:+         +:+     #
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2022/01/30 16:24:19 by acesar-l          #+#    #+#             #
#   Updated: 2022/01/30 16:24:22 by acesar-l         ###   ########.fr       #
#                                                                            #
##############################################################################

#!/bin/bash
echo Check 'if' there's at least 2 encrypted partitions using LVM:
lsblk
echo OK
echo Check 'if' the hostname of the virtual machine is my login ending
with 42 (acesar-l42):
hostname
echo OK
echo I have to modify this hostname during the evaluation
./set_hostname.sh Becker42
hostname
echo OK
echo Now, I have to create a new user and assign it to a group
./set_newuser.sh becker
echo OK
echo Check 'if' a strong password policy was implemented:
chage -l acesar-l
grep pam_cracklib.so /etc/pam.d/common-password
echo OK? You can try on your own
