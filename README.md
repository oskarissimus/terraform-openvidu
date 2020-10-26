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

it is also required to edit app.js files in web dir of examples below
they should have proper endpoint port and credentials:
var OPENVIDU_SERVER_URL = "https://" + location.hostname + ":443";
var OPENVIDU_SERVER_SECRET = "some_secret";
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

## some nice ssh tunneling options might be useful
```
tunnel to connect via vscode (ssh extension - ssh -p 22222 terraform@localhost)
autossh -N -L 22222:openvidu-fcfll61l:22 terraform@34.67.179.60

tunnel to connect via rscreen
autossh -N -L 2222:openvidu-fcfll61l:22 terraform@34.67.179.60
rscreen -p 2222 terraform@localhost
```