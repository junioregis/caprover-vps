# System

## 1. Set Sudo

```bash
ssh ubuntu@domain.com -t "sudo sh -c \"echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers\""
```

## 2. Install Essentials

```bash
ssh ubuntu@domain.com -t 'bash -s' < scripts/install.sh
```

`Wait for system reboot`

## 3. Install CapRover

```bash
ssh ubuntu@domain.com -t "docker run \
    -e MAIN_NODE_IP_ADDRESS='127.0.0.1' \
    -p 80:80 \
    -p 443:443 \
    -p 3000:3000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /captain:/captain caprover/caprover"
```

> In production, remove `MAIN_NODE_IP_ADDRESS='127.0.0.1'` line

## 4. Access

[http://captain.localhost:3000](http://captain.localhost:3000)

> Password `captain42`
