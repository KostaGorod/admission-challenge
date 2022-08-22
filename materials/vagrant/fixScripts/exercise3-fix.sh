#!/bin/bash
#add fix to exercise3 here

#One time script, we know to precise location of the error,pattern match is an overkill.

#echo "applying exercise3-fix.. #<really wanted to add but scared of "non-zero" fatal error in automations

#Delete lines {32..34}
gawk -i inplace 'NR!~/^(32|33|34)$/' /etc/apache2/sites-enabled/000-default.conf
systemctl restart apache2.service
