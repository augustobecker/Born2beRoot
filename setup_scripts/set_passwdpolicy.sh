##############################################################################
#                                                                            #
#                                                       :::      ::::::::    #
#   set_passwdpolicy.sh                                :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2022/01/31 01:24:19 by acesar-l          #+#    #+#             #
#   Updated: 2022/01/31 01:24:22 by acesar-l         ###   ########.fr       #
#                                                                            #
##############################################################################

#!/bin/bash

FILE=/etc/pam.d/common-password

sed -n '25 s/minlen=8/minlen=10/' $FILE
sed -n '25 s/difok=3/difok=7/' $FILE
sed -i '25 s/$/ maxrepeat=3 usercheck=1/' $FILE
sed -i '25 s/$/ ucredit=-1 dcredit=-1 enforce_for_root/' $FILE

echo "******************************************************************************"
echo "*                             PASSWORD POLICY                                *"
echo "******************************************************************************"
echo "* Your password must be at least 10 characters long.    | minlen=10          *"
echo "*                                                       |                    *"
echo "* It must contain an uppercase letter                   | ucredit=-1         *"
echo "* and a number.                                         | dcredit=-1         *"
echo "*                                                       |                    *"
echo "* It must not contain more than 3 consecutive           | maxrepeat=3        *"
echo "* identical characters.                                 |                    *"
echo "*                                                       |                    *"
echo "* The password must not include the name of the user.   | usercheck=1        *"
echo "*                                                       |                    *"
echo "* The password must have at least 7 characters that are | difok=7            *"
echo "* not part of the former password.                      |                    *"
echo "*                                                       |                    *"
echo "* The root password has to comply with this policy.     | enforce_for_root   *"
echo "******************************************************************************"
echo "*                  THIS SCRIPT WILL SELF-DESTRUCT                            *"
echo "* You can change those configurations in /etc/pam.d/common-password line 25  *"
echo "******************************************************************************"
