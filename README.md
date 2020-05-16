# The Ensign Project (KingPin)
### Purpose: 
Publish any service, hosted anywhere, with all the convenience of Public Cloud hosting & Automated LetsEncrypt Certificate enrollment. No local firewall control, or dynamic dns required.    
    
## Story: 
This project was born out of frastration with network obstructions to
maximising the flexibility of development & small scale / IoT service publishing.
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

### Public Cloud Providers:
  - [x] Google Cloud Platform (Free Tier Enabled)
  - [ ] Google Kubernetes Engine
  - [ ] AWS Free Tier
  - [ ] Azure Free Tier
  - [ ] Digital Ocean (in progress)
  - [ ] Vultr

```
                                   ~ DISCLAIMER ~  
          This project is not afiliated with any cloud provider by commercial 
          interest, social or professional connection, bias, or any other direct 
          or indirect loyalty or interest, use these tools at your own discretion.
```
