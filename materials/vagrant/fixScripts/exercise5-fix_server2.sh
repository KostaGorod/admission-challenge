#!/bin/bash
#add fix to exercise5-server2 here
#    IdentityFile /root/ssh/ssh_server1.pub
echo -e "\nHost server1\n    StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM50bljz3i48gM0Te7hQc6WKgVL2N6iA+tBDF/4G9Tth server1' >> /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys

echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM50bljz3i48gM0Te7hQc6WKgVL2N6iA+tBDF/4G9Tth server1' >> /home/vagrant/.ssh/authorized_keys
chmod 644 /home/vagrant/.ssh/authorized_keys 