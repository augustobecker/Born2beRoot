#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   passwd_policy.sh                                   :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/01/31 01:24:19 by acesar-l          #+#    #+#             
#   Updated: 2022/01/31 01:24:22 by acesar-l         ###   ########.fr       
#                                                                            
#

         PAM='/etc/pam.d/common-password'
        FILE='/etc/login.defs'
  PAM_POLICY=$(sed -n '25 p' $PAM | awk '{ print $4, $5, $6, $7, $8, $9, $10, $11}')
 USER_POLICY=$(sed -n '160 p; 161 p; 162 p' $FILE | paste -s -d ',' | sed 's/,/, /g')
           
       DIFOK=
      MINLEN=
  MAX_REPEAT=
     UCREDIT=
     DCREDIT=
   USERCHECK=
        ROOT=
        
echo "This is the former password policy:"
$PAM_POLICY
$USER_POLICY

echo "This is the new password policy:"
$PAM_POLICY
$USER_POLICY
