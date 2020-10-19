# terraform


## repo setup
```
https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t rsa -b 4096 -C "mail@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
``` 

## terraform install
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

## credentials
replace .credentials.dev.json with proper credentials

## logging into elastic throughopenvidu bastion
```
local$: ssh-add
local$: ssh -A terraform@xx.xx.xx.xx
terraform@bastion$: ssh 10.0.10.2
```

## installing docker and docker-compose on vm elastic
```
https://docs.docker.com/engine/install/debian/
https://docs.docker.com/compose/install/

$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

$ sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```
## elastic stack setup setup
https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-docker.html
```
#fix memory limit problem on debian
/sbin/sysctl -w vm.max_map_count=262144
docker-compose up
```
## tunneling via ssh to kibana
default kibana port is 5601
```
ssh -N -L 5601:10.0.10.2:5601 terraform@35.223.2.37
```
go to browser, and type `http://localhost:5601`