# Installation
* `sudo install ufw` - Install firewall in case it's not installed

# General 
* `ufw -help`

# Status
* `sudo ufw status` - Firewall status
* `sudo ufw status verbose` - Firewall verbose status
* `sudo ufw enable` - Activate, and start on system start (if it's inactive).
  By default it blocks external access to all ports on the server.
  This means that if you connect to a server via SSH and enable `ufw` before allowing 
  access on the SSH port, you will be disconnected.
* `sudo ufw disable` - Switching off the firewall


# Blocking and allowing connections
* `sudo ufw deny from 91.198.174.190` - Block all network connections originating from a specific IP address
* `sudo ufw deny in on eth0 from 198.174.0/24` - Block the subnet
* `sudo ufw deny in on eth0 from 91.198.174.192` - Block incoming connections from a specific IP address to a specific network interface
* `sudo ufw allow from 198.174.192` - Allow all network connections originating from a specific IP address
* `sudo ufw allow in on eth0 from 91.198.174.22` - Allow incoming connections from a specific IP address to a specific network interface

* `sudo ufw delete allow from 91.198.174.192` - Delete a rule previously installed in `ufw`
* `sudo ufw status numbered` - Display rule ids to remove some with `sudo ufw delete 1`


# Blocking and allowing connections to apps
* `sudo ufw app list` - List of available application profiles
* `sudo ufw allow <app-name>` - Include a profile for a specific application.


### Allow only HTTPS requests to your web server 
```bash
sudo ufw allow "Nginx HTTPS"
sudo ufw delete allow "Nginx Full"
```

### Enable SSH
To enable ssh connections:
```bash
sudo ufw allow OpenSSH
```
After adding this rule you'll be able to connect using ssh.
To check if it's enabled now run `sudo ufw status`

Less user-friendly, an alternative is to specify the exact port number of the SSH service.
```bash
sudo ufw allow 22
```

The following command will only allow SSH connections originating from IP address 91.198.174.33:
```bash
sudo ufw allow from 91.198.174.33 proto tcp to any port 22
```

You can also use the subnet address as the "from" parameter to allow incoming SSH connections from the entire network:
```bash
sudo ufw allow from 91.198.174.0/24 proto tcp to any port 22
```

### Allow incoming Rsync from a specific IP address or subnet
Rsync, which runs on port 873, can be used to transfer files from one computer to another.

To allow incoming rsync connections from a particular IP address or subnet:
```bash
sudo ufw allow from 91.198.174.33 to any port 873
```
To allow the entire 91.198.174.0/24 subnet to "rsync" to your server, run the command
```bash
sudo ufw allow from 91.198.174.0/24 to any port 873
```

### Allow nginx HTTP / HTTPS 
```bash
sudo ufw app list | grep Nginx
sudo ufw allow "Nginx Full"
```

### Allow Apache HTTP / HTTPS
```bash
sudo ufw app list | grep Apache
sudo ufw allow "Apache Full"
```

### Allow connection to MySQL from a specific IP address or subnet
* `sudo ufw allow from 91.198.174.33 to any port 3306` - Allow MySQL which listens for clients on port 3306.
* `sudo ufw allow from 91.198.174.0/24 to any port 3306` - To allow the entire subnet 91.198.174.0/24 to connect to your MySQL server,

### Allow connections to PostgreSQL from a specific IP address or subnet
* `sudo ufw allow from 91.198.174.33 to any port 5432` - PostgreSQL listens for client connections on port 5432
* `sudo ufw allow from 91.198.174.0/24 to any port 5432` - To allow the entire subnet 91.198.174.0/24 to connect to your PostgreSQL server
* `sudo ufw deny out 25` - To block outgoing SMTP connections. Mail servers such as Sendmail and Postfix normally use port 25 for SMTP traffic.
  If your server is not supposed to send outgoing mail, you can block this type of traffic. 

# Allowing ports
* `sudo ufw allow http`, `sudo ufw allow 80` - Allow http
* `sudo ufw allow https`, `sudo ufw allow 443` - Allow https
* `sudo ufw allow proto tcp from any to any port 80,443` - Allow all incoming http and https


# Remote server configuration
```bash
sudo ufw allow OpenSSH # Enable ssh, to be able connect through the ssh
sudo ufw enable # Enable firewall, so when the remote server will restart firewall will run as well
sudo ufw allow 443 # Enable https, so that nginx/apache will be exposed
```
# Resources
- [Basic UFW](https://serverspace.io/support/help/osnovnye-komandy-ufw/)
