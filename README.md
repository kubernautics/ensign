# The Ensign Project (KingPin)
### Purpose: 
Publish any service, hosted anywhere, with all the convenience of Public Cloud hosting & Automated LetsEncrypt Certificate enrollment. No local firewall control, or dynamic dns required.    
    
<<<<<<< HEAD
### Method: 
CI/CD Pipeline ready Ansible/Terraform/Bash/Golang Infrastructure-as-Code    
    
### Requirements:
  - Registered domain name
  - Control over the DNS server selection
  - Podman/Docker enabled starting point with internet access
  - Public Cloud Provider Account with a supported provider

### Public Cloud Providers:
  - [x] Google Cloud Platform (Free Tier Enabled)
  - [ ] Google Kubernetes Engine
  - [ ] AWS Free Tier
  - [ ] Azure Free Tier
  - [ ] Digital Ocean (in progress)
  - [ ] Vultr

=======
>>>>>>> 28f7ef89e20638dd4cf5ff806783a59b73f7a1fc
## Story: 
This project was born out of frustration with the tedium and obstructions of 
publicly publishing development & small scale / IoT services.
By leveraging state of the art, containerised overlay services, and inexpensive 
public cloud resources, Ensign builds a simple and unrestricted commercial
public hosted front-end for unified publishing and ingress of distributed lab, 
iot, and other distributed services.

### Requirements:
  - Registered domain name
  - Control over the DNS server forwarders
  - Google Compute Platform account    
  - Linux OS & Terminal to build from   
  - [Podman installed](https://podman.io/getting-started/installation.html)    
> docker may work but is currently untested     

#### Services & functions officially supported on the Ensign Node:
| Technology      | Function                       |
|:----------------|:-------------------------------|
| K3s             | Kubernetes                     |
| OpenWRT         | VFW Gateway                    |
| Wireguard       | VPN Overlay                    |
| HaProxy/Traefik | Reverse Proxy (ingress)        |
| HaProxy/Traefik | SSL Termination                |
| HaProxy         | Certificate Enrollment/Renewal | 
| OpenSSH         | SSH Proxy / Jump Host          |

<<<<<<< HEAD
#### Get Started:
=======
### Public Cloud Providers:
  - [x] Google Cloud Platform (Free Tier Enabled)
  - [ ] Google Kubernetes Engine
  - [ ] AWS Free Tier
  - [ ] Azure Free Tier
  - [ ] Digital Ocean (in progress)
  - [ ] Vultr

>>>>>>> 28f7ef89e20638dd4cf5ff806783a59b73f7a1fc
```
                                   ~ DISCLAIMER ~  
          This project is not afiliated with any cloud provider by commercial 
          interest, social or professional connection, bias, or any other direct 
          or indirect loyalty or interest, use these tools at your own discretion.
```
