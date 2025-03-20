# service-agent
Monitor infrastructure and Git service availability 

## Bare metal installation
- OS installation, ip, credentials
- OS configuration, hostname, timezone, language
- Required package installation, libvirt
- Service configuration, ssh

### Automation tools
- Ansible playbook
- Jenkins
- ssh

## System regular tasks
- Package update 
- Health monitoring, disk usage
- Backup, restore

## Normal operation
- Create a VM, host os, name, image

## Monthly backup

### VM
- VM clean up, ssh, ip
- VM shutdown, libvirt, host os, kvm name
- VM image shrink, ssh, host os, image name
- VM upload, smbclient, host os, image name
