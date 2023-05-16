# Installation
- `sudo nvim ssh/sshd_config`
- add lines
```
Match group sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
```
- Restart ssh services `sudo systemctl restart ssh`
- Create sftp users group `sudo addgroup sftp`
- Add user with password
```
sudo useradd -m sftpuser -g sftp
sudo passwd sftpuser
```
- Grant permissions to the specific directory `sudo chmod 700 /home/sftpuser/`

Note: sftp connection most likely will have port 22

# Connection
```bash
sftp sftpuser@192.168.99.101
```

Or can be used UI client:
- Filezilla
- Cyberduck
- Putty

# Resources
- [Setup sftp server ubuntu](https://linuxhint.com/setup-sftp-server-ubuntu/)
