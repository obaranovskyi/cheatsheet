# Installation
- `sudo apt update`
- `sudo apt install vsftpd`
- check status `systemctl status vsftpd`

---

# Setup

## Configure `vsftpd`
- Config location `/etc/vsftpd.conf`
- Uncomment `local_enable=YES` to allow local users to log in.
- Uncomment `write_enable=YES` to enable any form of FTP write command.

## To restrict users to stick their home directory
- Uncomment `chroot_local_users=YES`
- Add at the end of the file add these lines, to configure the routes that user can use
```
user_sub_token=$USER
local_root=/home/$USER/ftp
```
- Add the end of the file add ports for passive mode.
  These ports will be used if there is some firewall issue
  between client and server and ports 20 and 21 can't be accessed.
```
pasv_min_port=10000
pasv_max_port=10100
```
- Add these lines, to be sure the FTP server only allows access of users who are in its local database
  and not anyone else
```
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
```

## Add ftp user
- `sudo adduser ftpuser`
- `sudo passwd ftpuser`
- Create ftp folder in user home directory `sudo mkdir /home/ftpuser/ftp`
- Configure ownership `sudo chown nobody:nogroup /home/ftpuser/ftp`
- Remove the root ftp folder writable permission by running this command `sudo chmod a-w /home/ftpuser/ftp`
- Create an upload directory for the new user `sudo mkdir /home/ftpuser/ftp/upload`
- Create upload folder ownership for the new ftp user `sudo chown ftpuser:ftpuser /home/ftpuser/ftp/upload`
- Create a demo file inside of upload folder `echo "My FTP Server" | sudo tee /home/ftpuser/ftp/upload/demo.txt`
- Check if demo file is created `sudo cat /home/ftpuser/ftp/upload/demo.txt`
- We can check for permission by running this command `sudo ls -la /home/ftpuser/ftp`
- Add the created user ot the FTP user list so that it allows the user to log in and access the FTP server `echo "ftpuser" | sudo tee -a /etc/vsftpd.userlist`
- We can print users that can access FTP server by running this command `sudo cat /etc/vsftpd.userlist`

## How to secure the connection
Configure ssl using openssl, run this command, to generate the required 2048-bit private key and self-signed SSL certificate.
- `sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem`
- Edit `/etc/vsftpd.conf` file, and add the location of private key and SSL certificate, look for the certificate lines and replace them:
```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
ssl_enable=YES
```
- add these lines at the bottom of the file (`/etc/vsftpd.conf`), this will deny access to anonymous connection over SSL
  and force users to transfer data and log in using SSL only.
```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```
- Restart ftp server `sudo systemctl restart vsftpd`
- Check the status `sudo systemctl status vsftpd`


## Check ftp connection
- `systemctl reload vsftpd`
- `systemctl status vsftpd`

## Enable ftp to start on boot
- `systemctl enable vsftpd`

---

# Clients that can be used to connect to ftp
- Filezilla (I would prefer this, as after configuring ssl on remote cyberduck stopped working)
- Cyberduck
- Putty

# Resources
- [How to install an FTP server  on Ubuntu 22.04 with vsftp](https://www.youtube.com/watch?v=XNjOSY-wcb0)
