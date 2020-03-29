
https://cloud.digitalocean.com/droplets
https://console.cloud.google.com/net-services/dns/zones&authuser=1&folder&organizationId
```
git clone https://github.com/containercraft/ensign.git ~/ensign
```
```
lxd init
```
```
config:
  core.https_address: '[::]:8443'
  core.trust_password: SecretPasswd123
networks:
- config:
    ipv4.address: 192.168.121.1/24
    ipv4.nat: "true"
    ipv6.address: none
  description: ""
  managed: false
  name: lxdbr0
  type: ""
storage_pools:
- config:
    size: 120GB
  description: ""
  name: default
  driver: btrfs
profiles:
- config: {}
  description: ""
  devices:
    eth0:
      name: eth0
      network: lxdbr0
      type: nic
    root:
      path: /
      pool: default
      type: disk
  name: default
cluster: null
```
```
sudo apt-get update && sudo apt-get upgrade -y
```
```
```
```
```
```
```
```
```

