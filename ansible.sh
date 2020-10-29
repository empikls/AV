
#!/bin/bash


        echo "Installing Ansible dependencies and Git."
        sudo apt-get update -qq
        #sudo apt-get install -y -qq git python-yaml python-paramiko python-jinja2
        sudo apt-get install -y -qq git python python-dev
         
        echo "Installing pip"
	sudo apt-get install -y python-pip
	sudo apt-get install -y python3-pip
        # Make sure setuptools are installed crrectly.
        sudo pip3 install --upgrade setuptools
        echo "Installing required python modules."
        sudo pip3 install -y paramiko pyyaml jinja2 markupsafe
        sudo pip3 install -y ansible

