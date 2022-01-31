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

echo "\
****************************************************************************** \
* Your password must be at least 10 characters long     | minlen=10          * \
* It must contain an uppercase letter \                 | ucredit=-1         * \
* and a number. \                                       | dcredit=-1         * \
* It must not contain more than 3 consecutive           |                    * \
* identical characters.                                 | maxrepeat=3        * \
* The password must not include the name of the user    | usercheck=1        * \
* The password must have at least 7 characters that are |                    * \
* not part of the former password.                      | difok=7            * \ 
* The root password has to comply with this polic       | enforce_for_root   * \ 
****************************************************************************** "
