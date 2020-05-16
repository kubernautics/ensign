# Get Started:
### Setup Google Compute Platform 
  - In your browser:     
  1. GCP [Get Started Free](https://cloud.google.com/free)
  2. Create Account
  3. [Enable/Add Billing Permission](https://console.cloud.google.com/getting-started)    
  - In your Terminal:    
```
mkdir ~/.ccio 2>/dev/null
git clone https://github.com/ministackio/ensign.git ~/.ccio/ensign
```
```
podman pod create \
    --name ccio-user               \
    --pod-id-file ~/.ccio/.pod.id
```
```
podman run \
    --name one      --hostname one       \
    --detach        --privileged         \
    --pull always   --userns=keep-id     \
    --pod ccio-user --restart on-failure \
    --volume ${HOME}/.ssh:/root/.ssh:z   \
    --volume ${HOME}/.ccio:/root/.ccio:z \
  quay.io/containercraft/one:ccio
```
```
podman exec --interactive --tty one connect
```
```
  gcloud init
```
  - open hyperlink provided & login
  - allow sdk access rights
  - copy code back into terminal prompt
  - create new project 
  - enter new project id name 
>    Example: `ministackdev`
  - open web console to verify 
>    Example: https://console.cloud.google.com/getting-started?project=ministackdev
  - open billing console & link new project to billing account 
>    Example: https://console.cloud.google.com/billing/linkedaccount?project=ministackdev

```
  gcloud projects list
  gcloud config set project ministackdev
  gcloud services list --available
  gcloud services list --available | grep -i dns
```
```
  gcloud iam service-accounts create terraform --description="cloudctl terraform iam role" --display-name=terraform --project=ministackdev
  gcloud iam service-accounts keys create $GOOGLE_APPLICATION_CREDENTIALS --iam-account terraform@ministackdev.iam.gserviceaccount.com
  gcloud projects add-iam-policy-binding ministackdev --member serviceAccount:terraform@ministackdev.iam.gserviceaccount.com --role roles/admin
```
```
./ensign/ansible/run
```
## Check DNS Servers
  - In a browser:
>    Example: https://domains.google.com/m/registrar/ministack.dev/dns )
  - In a terminal:
```
gcloud dns managed-zones describe ministackdev | awk '/googledomains/{print $2}' | sed 's/\.com\./.com/g'
```
## Forward your Registrar Nameservers to these servers

 
```
##################################################################
# Quick Refrence Notes:
https://cloud.google.com/compute/vm-instance-pricing#sharedcore
https://cloud.google.com/dns/docs/migrating << how to migrate DNS to GCP
# Troubleshoot instance startup with
# - $ gcloud compute --project=ministackdev instances get-serial-port-output ensign --zone=us-west3-a
  gcloud services enable dns.googleapis.com --async
  gcloud services enable iam.googleapis.com --async
  gcloud dns managed-zones create --visibility=public --dns-name="ministack.dev" --description="A zone" "ministackdev"

  terraform import google_compute_address.ensign_public_ipv4 projects/ministackdev/regions/us-west3/addresses/ensign-public-ipv4
```
