## Step 1 (Master)
```shell script
docker compose -f ./docker-compose-master.yaml up -d
docker container exec -it jenkins-master /bin/bash
``` 
(1) init password 
```shell script
cat /var/jenkins_home/secrets/initialAdminPassword
```
(2) ssh-keygen  
```
ssh-keygen -t rsa -C ""
```
(3) id_rsa.pub
```
cat ~/.ssh/id_rsa.pub
```
(4) id_rsa
```
cat ~/.ssh/id_rsa
```

## Step 2 (Worker)
* docker-compose-worker.yaml >> JENKINS_SLAVE_SSH_PUBKEY value change master id_rsa.pub
* worker container bash
```
docker compose -f ./docker-compose-worker.yaml up -d
docker container exec -it jenkins-worker01 /bin/bash
```
(1) java path 
```
which java
```

## Step 3 (Master)
ssh-copy-id auth
```
ssh-copy-id jenkins@jenkins-worker01
```

## Step 3 (Browser)
* localhost:8080
* initialAdminPassword enter
* install jenkins plugins
* system > node > add node
    * Remote root directory : /var/jenkins_home
    * Launch method : Launch agents via SSH
    * Host : jenkins_worker01
    * Credentials
        * Kind : SSH Username with private key
        * UserName : jenkins   (Step 3 ssh-copy-id agent-name)
        * Private Key : Master container > ~/.ssh/id_rsa (Step 1 > (4))
    * Host Key Verification Strategy : Known hosts file Verification Strategy
    * more > java path : Worker container java path (Step 2 > (1))