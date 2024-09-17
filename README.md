# Ansible-Terraform :
### Building cloud infrastructure with terraform and configuring virtual machines with ansible. 

## Infrastructure: 
- 1 VM bastion 
- 1 VM gitlab
- 6 VM

## Description of each VM: 
- VM bastion: has a public ip address and access to the other VM's

- VM gitlab: access is by domain name through VM bastion (DNSaaS is raised for this purpose).

- other VMs: access is  through VM bastion.