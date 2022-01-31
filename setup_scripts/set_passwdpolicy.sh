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
sed -n '25 s/minlen=8/minlen=10/' /etc/pam.d/common-password
sed -n '25 s/difok=3/difok=7 \\/' /etc/pam.d/common-password
sed -n -i '25 a ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=1 enforce_for_root' \
    /etc/pam.d/common-password
