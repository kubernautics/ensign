# Get Started:
#### Setup Google Compute Platform 
  - In your browser:     
  1. GCP [Get Started Free](https://cloud.google.com/free)
  2. Create Account
  3. [Enable/Add Billing Permission](https://console.cloud.google.com/getting-started)    
  - In your Terminal:    
#### Make a local directory for artifacts
```
mkdir -p ~/.ccio/profile.d 2>/dev/null
```
#### Clone the ensign repo
```
git clone https://github.com/ministackio/ensign.git ~/.ccio/ensign
```
#### Copy the ensign profile to your ccio/profile.d directory
  - Open and edit to your variables
```
cp ~/.ccio/ensign/profile/example ~/.ccio/profile.d/ensign
```
#### Start a pod to run containers in
```
podman pod create \
    --name ccio-user               \
    --pod-id-file ~/.ccio/.pod.id
```
#### Launch ContainerOne
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
#### Connect to ContainerOne
```
podman exec --interactive --tty one connect
```
#### Setup google credentials & project
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
#### Build GCP IAM Policy to allow terraform actions
```
  gcloud iam service-accounts create terraform --description="terraform iam role" --display-name=terraform --project=${ccioEnsign_nameGcpProject}
  gcloud iam service-accounts keys create $GOOGLE_APPLICATION_CREDENTIALS --iam-account terraform@${ccioEnsign_nameGcpProject}.iam.gserviceaccount.com
  gcloud projects add-iam-policy-binding ${ccioEnsign_nameGcpProject} --member serviceAccount:terraform@${ccioEnsign_nameGcpProject}.iam.gserviceaccount.com --role roles/admin
```
#### Run the top level ansible playbook
```
./ensign/ansible/run
```
#### Check DNS Servers
  - In a terminal:
```
gcloud dns managed-zones describe ${ccioEnsign_nameGcpProject} | awk '/googledomains/{print $2}' | sed 's/\.com\./.com/g'
```
  - In a browser:
>    Example: https://console.cloud.google.com/net-services/dns/zones
    
#### Forward your Registrar Nameservers to these servers
>    Example: https://domains.google.com/m/registrar/

#### Done! 

```
##################################################################
# Quick Refrence Notes:
  https://cloud.google.com/compute/vm-instance-pricing#sharedcore
  https://cloud.google.com/dns/docs/migrating << how to migrate DNS to GCP

# Troubleshoot instance startup with
  gcloud compute --project=${ccioEnsign_nameGcpProject} instances get-serial-port-output ensign --zone=us-west3-a
  gcloud services enable dns.googleapis.com --async
  gcloud services enable iam.googleapis.com --async
  gcloud dns managed-zones create --visibility=public --dns-name="ministack.dev" --description="A zone" "${ccioEnsign_nameGcpProject}"
  terraform import google_compute_address.ensign_public_ipv4 projects/${ccioEnsign_nameGcpProject}/regions/us-west3/addresses/ensign-public-ipv4
```
