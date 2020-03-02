## Getting Started

Configure the nexus private repository.
This is a sample project for downloading java, ruby gems, and yum files from a non-Internet development environment.

### Prerequisites

* centos 7
* java 8 (nexus 3.x)

### Nexus Installation

Download nexus 3.x
```shell script
mkdir /data
wget -O /data http://download.sonatype.com/nexus/3/latest-unix.tar.gz     
tar xvfz /data/nexus.tar.gz -C /opt/nexus --strip-components 1   
cd /opt/nexus/   
```

Add Nexus User and Create Folder
```shell script
sudo useradd --system nexus

chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /data/nexus-data

ln -s /data/nexus/nexus3 nexus-data
ln -s /opt/nexus nexus-config
```

Set Enviroment
```shell script
# bashrc
vi /etc/bashrc
   export NEXUS_HOME=/opt/nexus
source /etc/bashrc

# nexus.vmoptions refer
vi /opt/nexus/bin/nexus.vmoptions

# nexus-default.properties refer   
vi /opt/nexus/etc/nexus-default.properties
``` 
Firewall and Selinux Port
```shell script
firewall-cmd --permanent --add-port=8800/tcp

semanage port -l | grep http_port_t
semanage port -a -t http_port_t -p tcp 8800
```

Start Nexus
```shell script
# nexus.service refer
vi /etc/systemd/system/nexus.service
systemctl enable nexus
systemctl daemon-reload
systemctl start nexus
systemctl status nexus
```

## Usage

### log
```shell script
tail -f /data/nexus-data/nexus3/log/nexus.log
```
### Nexus login
Admin Password Path : cat /data/nexus-data/nexus3/admin.password
```
http://localhost:8800
id : admin
password : {password}
```


## License

Distributed under the MIT License. See `LICENSE` for more information.
