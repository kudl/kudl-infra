## Getting Started

This is a refer to [kylemanna github](https://github.com/kylemanna/docker-openvpn) based on docker.

Use TCP, OTP

### Installation

1. Create a volume Path

```shell script
OVPN_DATA="ovpn-data-kudl"
```

2. Initialize and Generate certificate authority.
`vpn.kudlwork.com` Change the domain to your `vpn domain`.

```sh
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u tcp://vpn.kudlwork.com -2 -C AES-256-CBC
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
```

3. Run Docker
If you want to do something else when you log in or out, you can write `--script-security 2 --up /path/to/your/script` in `openvpn.conf` file.

```sh
docker run --name openvpn -v $OVPN_DATA:/etc/openvpn -d -p 443:1194/tcp --cap-add=NET_ADMIN kylemanna/openvpn
docker update --restart=always openvpn
```

4. Create User
`kudl` Change the username to your `username`.

```sh
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full kudl nopass
```

5. Generate OTP
`kudl` Change the username to your `username`.
If you want to pass the first time you require authentication, you can enter -1 or skip.

```shell script
docker run -v $OVPN_DATA:/etc/openvpn --rm -i kylemanna/openvpn ovpn_otp_user kudl
```

6. Export OVPN file
`kudl` Change the username to your `username`.

```shell script
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient kudl > kudl.ovpn
```

## Usage

1. remove user
`kudl` Change the username to your `username`.

```shell script
docker run --rm -it -v $OVPN_DATA:/etc/openvpn kylemanna/openvpn ovpn_revokeclient kudl remove
```

2. docker openvpn install curl
use `docker ps -a` container_id Change the username to your `container_id`.

```shell script
docker exec -it container_id /bin/bash
apk add curl
```