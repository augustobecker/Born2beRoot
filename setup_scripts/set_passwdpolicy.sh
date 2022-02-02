#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   set_passwdpolicy.sh                                :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/31 01:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/01/31 01:24:22 by acesar-l         ###   ########.fr       
#                                                                            
#

POLICY=`(find . \( -type f -name password_policy_42.txt\) | wc -l)`

PAM=/etc/pam.d/common-password
FILE=/etc/login.defs

TXT=password_policy_42.txt

if [[ $POLICY -ge 1 ]]
then
echo "This is the former password policy:"
sed -n '25 p' $PAM | awk '{ print $4, $5, $6, $7, $8, $9, $10, $11}
fi

sed -n '25 s/minlen=8/minlen=10/' $PAM
sed -n '25 s/difok=3/difok=7/' $PAM
sed -i '25 s/$/ maxrepeat=3 usercheck=1/' $PAM
sed -i '25 s/$/ ucredit=-1 dcredit=-1 enforce_for_root/' $PAM

sed -i '102 s/$/\/snap\/bin/' $FILE
sed -i '160 s/99999/30/' $FILE
sed -i '161 s/0/2/' $FILE

touch $TXT
echo "******************************************************************************" > $TXT
echo "*                             PASSWORD POLICY                                *" >> $TXT
echo "******************************************************************************" >> $TXT
echo "* Your password must be at least 10 characters long.    | minlen=10          *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* It must contain an uppercase letter                   | ucredit=-1         *" >> $TXT
echo "* and a number.                                         | dcredit=-1         *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* It must not contain more than 3 consecutive           | maxrepeat=3        *" >> $TXT
echo "* identical characters.                                 |                    *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* The password must not include the name of the user.   | usercheck=1        *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* The password must have at least 7 characters that are | difok=7            *" >> $TXT
echo "* not part of the former password.                      |                    *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* The root password has to comply with this policy.     | enforce_for_root   *" >> $TXT
echo "******************************************************************************" >> $TXT
echo "* You can change those configurations in /etc/pam.d/common-password line 25  *" >> $TXT
echo "******************************************************************************" >> $TXT
echo "* Your password has to expire every 30 day.             | PASS_MAX_DAYS 30   *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* The minimum number of days allowed before the         | PASS_MIN_DAYS 2    *" >> $TXT
echo "* modification of a password will be set to 2.          |                    *" >> $TXT
echo "*                                                       |                    *" >> $TXT
echo "* The user has to receive a warning message 7 days      | PASS_WARN_AGE 7    *" >> $TXT
echo "* before their password expire                          |                    *" >> $TXT
echo "******************************************************************************" >> $TXT
echo "* You can change those configurations in /etc/login.defs lines 160 until 162 *" >> $TXT
echo "******************************************************************************" >> $TXT

echo " You can check the password policy at password_policy_42.txt"
