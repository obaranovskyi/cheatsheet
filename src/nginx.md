## Best Resources
- nginx.org

## Install

```bash
sudo apt install nginx
```
But this is the bad way of installation as not everything will be installed.
You need to Build nginx from source:
- Open `downloads` on nginx.org and copy path to nginx `gz` file, (http://nginx.org/download/nginx-1.23.4.tar.gz)
- `wget http://nginx.org/download/nginx-1.23.4.tar.gz`
- `tar -zxvf nginx-1.23.4.tar.gz`
- `cd nginx-1.23.4`
- `sudo apt-get install build-essential`
- `sudo apt-get install libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev`
- `./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module`
- Compile by running `make` command
- Install the compiled source by running command: `sudo make install`
- Check the configuration `ls -l /etc/nginx/`
- Restart the terminal (if it's ssh reconnect)
- Check the installation `nginx -V`
- Start nginx by running `nginx`
- Check if it's running `ps aux | grep nginx`, we can also `ping $(hostname -I | awk '{print $2}')`

## Adding nginx as a `systemd` service
Helps to start, stop, restart, reload etc.
Makes start boot much simpler.

## Modules
Open documentation, and there will be list of modules at the bottom of the page.
For example if we are going to use `ssl` we need to install
ssl module. We can do it when we run configure script
(`./configure ....`) by adding this flag `--with-http_ssl_module`.
If more information is needed we can open this module and read 
about configuration etc.

## Uninstall 
Removes all but configs files:
```bash
sudo apt-get remove nginx nginx-common
```
Removes everything
```bash
sudo apt-get purge nginx nginx-common
```
After using any of the above commands,
use this in order to remove dependencies used by nginx 
which are no longer required


## Starting, Stopping, and Reloading Configuration

To control nginx use this syntax:
`nginx -s signal`

```bash
service nginx status
```
You can run also:
- `stop` - 
- `start`
- `restart`
- `reload`

to check all commands run `service nginx`

Note: there is one more way to check if nginx is running:
```bash
sudo lsof -i TCP:80
```

Another way to start/stop nginx on Ubuntu is:
```bash
sudo systemctl start nginx
sudo systemctl stop nginx
```

#### Checking if nginx configuration doesn't have any issues
```bash
sudo nginx -t
```

#### Reload nginx 
```bash
sudo nginx -s reload
```

#### Configuration path:


On ubuntu `/etc/nginx/sites-available/default`

to find `sudo find . -type f -name default`

#### Terminology
```nginx
events {
    worker_connections 1024;
}
```

- Key/value pair in configuration are known as directives.
In current case, `worker_connection 1024` is directive.

- `events { ... }` is known as the context.

#### Configuration explanation
* `ssl_certificate` - specifies public key
* `ssl_certificate_key` - specifies private key

