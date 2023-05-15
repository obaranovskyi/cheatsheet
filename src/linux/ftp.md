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


## Check ftp connection
- `systemctl reload vsftpd`
- `systemctl status vsftpd`

---

# Clients that can be used to connect to ftp
- Cyberduck
- Filezilla
- Putty
