#!/bin/bash
#add fix to exercise5-server2 here

echo -e "\nHost server1\n    StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM50bljz3i48gM0Te7hQc6WKgVL2N6iA+tBDF/4G9Tth server1' >> /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys

echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM50bljz3i48gM0Te7hQc6WKgVL2N6iA+tBDF/4G9Tth server1' >> /home/vagrant/.ssh/authorized_keys
chmod 644 /home/vagrant/.ssh/authorized_keys 

echo '-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDOdG5Y894uPIDNE3u4UHOlioFS9jeogPrQQxf+BvU7YQAAAJCrZhqWq2Ya
lgAAAAtzc2gtZWQyNTUxOQAAACDOdG5Y894uPIDNE3u4UHOlioFS9jeogPrQQxf+BvU7YQ
AAAEBG95BG6vL7X/nRjluYFxOVuNjzyBqq4+7y+oF3cLHJ5M50bljz3i48gM0Te7hQc6WK
gVL2N6iA+tBDF/4G9TthAAAAB3NlcnZlcjEBAgMEBQY=
-----END OPENSSH PRIVATE KEY-----
' >> /root/.ssh/id_ed25519
chmod 600 /root/.ssh/id_ed25519

echo '-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDOdG5Y894uPIDNE3u4UHOlioFS9jeogPrQQxf+BvU7YQAAAJCrZhqWq2Ya
lgAAAAtzc2gtZWQyNTUxOQAAACDOdG5Y894uPIDNE3u4UHOlioFS9jeogPrQQxf+BvU7YQ
AAAEBG95BG6vL7X/nRjluYFxOVuNjzyBqq4+7y+oF3cLHJ5M50bljz3i48gM0Te7hQc6WK
gVL2N6iA+tBDF/4G9TthAAAAB3NlcnZlcjEBAgMEBQY=
-----END OPENSSH PRIVATE KEY-----
' >> /home/vagrant/.ssh/id_ed25519
chmod 600 /home/vagrant/.ssh/id_ed25519
chown vagrant:vagrant /home/vagrant/.ssh/id_ed25519