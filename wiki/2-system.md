# 2.1. Install Essentials

```bash
ssh root@domain.com -t 'bash -s' < scripts/install.sh
```

> `Wait for system reboot`

# 2.2. Install CapRover

```bash
ssh root@domain.com -t "docker run \
    -e MAIN_NODE_IP_ADDRESS='127.0.0.1' \
    -p 80:80 \
    -p 443:443 \
    -p 3000:3000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /captain:/captain caprover/caprover"
```

> In production, remove `MAIN_NODE_IP_ADDRESS='127.0.0.1'` line
