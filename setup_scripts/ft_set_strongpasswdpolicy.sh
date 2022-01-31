##############################################################################
#                                                                            #
#                                                       :::      ::::::::    #
#   ft_set_strongpasswdpolicy.sh                       :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2022/01/31 01:24:19 by acesar-l          #+#    #+#             #
#   Updated: 2022/01/31 01:24:22 by acesar-l         ###   ########.fr       #
#                                                                            #
##############################################################################

#!/bin/bash
$CRACKLIB = `cat /etc/pam.d/common-password | grep pam_cracklib.so`
$NEW_POLICY = password       required        pamcracklib.so difok=7 minlen=10
ucredit=-1 dcredit=-1 retry=3 maxrepeat=3 usercheck=1 enforce_for_root
sed "s/$CRACKLIB/$NEW_POLICY/g" /etc/pam.d/common-password | grep "use this to
hide the output :)"
