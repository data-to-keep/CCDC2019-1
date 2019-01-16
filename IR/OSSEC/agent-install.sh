#!/bin/sh

#git clone [CyberDragonsGithub]
wget https://github.com/ossec/ossec-hids/archive/3.1.0.tar.gz
tar -xvzf 3.1.0.tar.gz
#mv [CyberDragonsGithub]/autofill-conf ossec-hids-3.1.0/etc
sh ossec-hids-3.1.0/install.sh

/var/ossec/bin/manage_agents

/var/ossec/bin/ossec-control restart
