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

## logging into openvidu through bastion
```
local$: ssh-add
local$: ssh -A terraform@xx.xx.xx.xx
terraform@bastion$: ssh 10.0.10.2
```

## installing docker and docker-compose on vm openvidu
```
https://docs.docker.com/compose/install/

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## installing openvidu on vm openvidu
```
cd /opt
curl https://s3-eu-west-1.amazonaws.com/aws.openvidu.io/install_openvidu_latest.sh | sudo bash
cd openvidu
vim .env
./openvidu start
```

## setting up openvidu examples
```
git clone https://github.com/OpenVidu/openvidu-tutorials.git
sudo apt install -y npm
sudo npm install -g http-server
```
## running openvidu hello-world
```
http-server openvidu-tutorials/openvidu-hello-world/web
```

## running openvidu filters example
```
cd openvidu-tutorials/openvidu-filters/web/
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
http-server -S
```