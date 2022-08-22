#!/bin/bash
#add fix to exercise3 here
#Require all granted
echo "applying exercise3-fix.."	
#One time script, we know to precise location of the error,pattern match is an overkill.
gawk -i inplace 'NR!~/^(32|33|34)$/' /etc/apache2/sites-enabled/000-default.conf
systemctl restart apache2.service
