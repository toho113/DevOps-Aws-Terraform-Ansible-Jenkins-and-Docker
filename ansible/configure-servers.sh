#! /bin/bash
echo "Configure Jenkins server by Ansible"
echo "$ansible-playbook provision_jenkins.yaml"
ansible-playbook provision_jenkins.yaml

echo "Configure Web server by Ansible"
echo "$ansible-playbook provision_web.yaml"
ansible-playbook provision_web.yml
