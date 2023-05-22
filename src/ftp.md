## Installation
Update package list for upgrades.
```bash
sudo apt update
```
Install [`vsftpd`](https://security.appspot.com/vsftpd.html) which is probably the most secure and fastest FTP server for UNIX-like systems. \
`vsftpd` stands for **very secure FTP daemon**. 
```bash
sudo apt install vsftpd
```
Now check if the `vsftpd` is active:
```bash
systemctl status vsftpd
```
If it's not running, activate it with the following command:
```bash
systemctl start vsftpd
```

## Setup
Open `vsftpd` configuration file with `nano`, `vim`, or any other editor:
```
vim /etc/vsftpd.conf
```
Uncomment lines with `local_enables=YES` and `write_enable=YES`
```
local_enable=YES
write_enable=YES
```
- `local_enable` - Allow local users to log in
- `write_enable` - Enable any form of FTP write command

Restrict users so that they will stick to their home directory. 
```bash
chroot_local_users=YES
```

Add two lines below to the end of the file, to configure the routes that user will be able to use:
```
user_sub_token=$USER
local_root=/home/$USER/ftp
```

We also want to allow FTP connection to users that are predefined in the local database and no one else:
```
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
```
If ports 20 or 21 can't be accessed because of the firewall issue between the server and the client,
we need to add ports for passive mode.
```
pasv_min_port=10000
pasv_max_port=10100
```
Configure the firewall, by opening these ports:
```bash
sudo ufw allow from any to any port 20,21,10000:10100 proto tcp
```

## Add user responsible for file uploads to the remote server
```bash
sudo adduser ftp_user
```

If it didn't ask you about the password, run this command:
```bash
sudo passwd ftp_user
```

Allocate folder to ftp user, and configure ownership:
```bash
sudo mkdir -p /home/ftp_user/ftp
sudo chown nobody:nogroup /home/ftp_user/ftp
sudo chmod a-w /home/ftp_user/ftp
sudo mkdir /home/ftp_user/ftp/upload_dir
sudo chown ftp_user:ftp_user /home/ftp_user/ftp/upload_dir
```
Add FTP user to vsftpd userlist to allow `ftp_user` to login to FTP server:
```bash
sudo touch /etc/vsftpd.userlist
```
and put our fpt username to this file:
```
ftp_user
```


## Secure the connection
Configure ssl using `openssl`, run this command, to generate the required 2048-bit private key and self-signed SSL certificate.
```bash
sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
```
Update `vsftpd` pem key location path in the configuration file(`/etc/vsftpd.conf`):

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
ssl_enable=YES
```

Now we need to deny access to the anonymous connection.
We only need to leave the secure way of transferring data:
```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```
Everything is done on the server side.
We only need to restart the ftp server `systemctl restart vsftpd`


**Note:** our ftp connection most likely will have port 21.

**Note:** If you want ftp server to start on boot, run `systemctl enable vsftpd`


## Connect to the remote FTP server
Install [Filezilla](https://filezilla-project.org/), enter the remote IP address, select FTP protocol,
and you're ready to transfer files to the remote with the secure connection.
