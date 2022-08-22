#!/bin/bash
#add fix to exercise2 here

#echo "applying exercise2-fix.."	#<really wanted to add but scared of "non-zero" fatal error in automations

#sed af
sed -i -e '/^127.0.0.1 www.ascii-art.de/ s/./#&/' /etc/hosts
