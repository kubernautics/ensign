# The Ensign Project (KingPin)
### Purpose: 
Publish any service, hosted anywhere, with all the convenience of Public Cloud hosting & Automated LetsEncrypt Certificate enrollment.    
    
### Method: 
CI/CD Pipeline ready Ansible/Terraform/Bash/Golang Infrastructure-as-Code    
    
### Requirements:
  - Registered domain name
  - Control over the DNS server selection
  - Podman/Docker enabled starting point with internet access

### Public Cloud Providers:
  - [x] Google Cloud Platform (Free Tier Enabled)
  - [ ] Google Kubernetes Engine
  - [ ] AWS Free Tier
  - [ ] Azure Free Tier
  - [ ] Digital Ocean (in progress)
  - [ ] Vultr

## Story: 
This project was born out of frastration with network obstructions to
maximising the flexibility of development & small scale / IoT service publishing.
By leveraging state of the art, containerised overlay services, and inexpensive 
public cloud resources, Ensign builds a simple and unrestricted commercial
public IP front-end for unified publishing and ingress of distributed lab, 
iot, and other distributed services.

#### Services & functions officially supported on the Ensign Node:
  - Kubernetes - K3s 
  - VFW Gateway -  OpenWRT
  - Wireguard VPN Service
  - Reverse Proxy - HaProxy/Traefik 
  - SSL Termination - HaProxy/Traefik 
  - SSL Certificate Enrollment & Renewal - HaProxy
  - Master Edge Bastion - SSH Proxy / Jump Host Entrypoint

#### Sketching steps
```
git clone https://github.com/ministackio/ensign.git ~/Git/ensign
cd ~/Git/ensign/ansible
./master
```
