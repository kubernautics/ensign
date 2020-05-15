# The Ensign Project (KingPin)
### Purpose: 
Publish any service, hosted anywhere, with all the convenience of Public Cloud hosting & Automated LetsEncrypt Certificate enrollment. No local firewall control, or dynamic dns required.    
    
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
public hosted front-end for unified publishing and ingress of distributed lab, 
iot, and other distributed services.

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

#### Sketching steps
```
mkdir ~/.ccio 2>/dev/null
git clone https://github.com/ministackio/ensign.git ~/.ccio/ensign
```
```
sudo podman pod create \
    --name ccio-user               \
    --pod-id-file ~/.ccio/.pod.id
```
```
sudo podman run \
    --name one                           \
    --hostname one                       \
    --detach                             \
    --privileged                         \
    --pull always                        \
    --pod ccio-user                      \
    --restart on-failure                 \
    --workdir /root/.ccio                \
    --volume ${HOME}/.ssh:/root/.ssh:ro  \
    --volume ${HOME}/.ccio:/root/.ccio:z \
  quay.io/containercraft/one:ccio
```
```
sudo podman exec --interactive --tty one connect
```
