# Installation

Ubuntu/Mint

```bash
sudo apt install openssh-server
```

# Check if it's enabled

```bash
sudo systemctl is-enabled ssh
```
we also can check like this:
```bash
sudo systemctl status ssh
```

# Enabling ssh
```bash
sudo systemctl enable ssh
```

# Start ssh
```bash
sudo systemctl start ssh
```


# Fixing `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`
```bash
ssh-keygen -R [IP_ADDRESS]
```
