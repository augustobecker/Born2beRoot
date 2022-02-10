
#!/bin/bash

#
#                                                                            
#                                                       :::      ::::::::    
#   complete_setup.sh                                  :+:      :+:    :+:   
#                                                    +:+ +:+         +:+     
#   By: acesar-l <acesar-l@student.42sp.org.br     +#+  +:+       +#+        
#                                                +#+#+#+#+#+   +#+           
#   Created: 2022/02/10 17:18:19 by acesar-l          #+#    #+#             
#   Updated: 2022/02/10 17:22:22 by acesar-l         ###   ########.fr       
#                                                                            
#

chmod a+x *

./install_packages.sh

sysetmctl enable apparmor

./set_firewall.sh
./set_passwdpolicy.sh
./set_sshserver.sh
./set_loginuser.sh
