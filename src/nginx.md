## Best Resources
- nginx.org

---

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

### Module explanations
- `--with-pcre` - using regular expression in `location` block
- `--with-http_ssl_module` - ssl support

---

# Modules
Open documentation, and there will be list of modules at the bottom of the page.
For example if we are going to use `ssl` we need to install
ssl module. We can do it when we run configure script
(`./configure ....`) by adding this flag `--with-http_ssl_module`.
If more information is needed we can open this module and read 
about configuration etc.

---

## Adding nginx as a `systemd` service
Helps to start, stop, restart, reload etc.
Makes start boot much simpler.

- Open nginx.com and find nginx init script (`https://www.nginx.com/resources/wiki/start/topics/examples/initscripts/`)
- Navigate to example `NGINX systemd service file`
- Navigate to folder `/lib/systemd/system/nginx.service`
- Create file `nginx.service`, with content:
```
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

- We need to update some configurations
```
PIDFile=/var/run/nginx.pid 
ExecStartPre=/usr/bin/nginx -t
ExecStart=/usr/bin/nginx
ExecReload=/usr/bin/nginx -s reload
```

- If nginx is running we need to stop it `nginx -s stop`
- Check if it's stopped `ps aux | grep nginx` (should be one not three)
- Start nginx with systemctl command `systemctl start nginx` (to stop `systemctl stop nginx`)
- Now we can check nginx status `systemctl status nginx`

---

# Enable nginx startup on boot
- `systemctl enable nginx`
- Reboot the machine, run `reboot`

---

# Terminology

### Context 
Context is the same as scope
- `events { ... }` is known as the context.

Context might be nested, and inherited from the parent
This is called `Main Context` and is where we configure the global directives
that apply to the master process.
```nginx
http {
    index index.html index.html index.php;

    include  mime.types;

    server {
        listen      80;
        servername  mydomain.com;
        access_log  /var/log/mydomain.com.access.log main;
        root        html;

        location /some_path {
            add_header header_name header_value;
        }
    }
}
```

### Directive
```nginx
events {
    worker_connections 1024;
}
```
- Key/value pair in configuration are known as directives.
In current case, `worker_connection 1024` is directive.

---

## Configuration
The main file we're going to edit `/etc/nginx/nginx.conf`
If we don't have anything in `events {}`, we still need to keep it to have valid nginx configuration.

configuration file example:
```nginx
# Even if we don't have anything inside events
# we still need to keep it to have a valid
# nginx configuration
events {}

http {
    server {
        listen 80;
        # domain, subdomain or ip address
        server_name localhost;

        # the root path from which nginx will be serving requests 
        root /sites/demo;

    }
}
```

For this changes to take an effect reload nginx `sudo systemctl reload nginx`
Note: you also need to give rights to that folder `/sites/demo`:
```bash
chmod 777 /sites /sites/demo /sites/demo/*
```

---

## Include another configuration
In the previous example configuration, we won't have styles etc.
This is because nginx doesn't understand the mime types.
In nginx folder we have `mime.types` file.
Let's include this file:
```nginx
events {}

http {
    include mime.types;
    server {
        # ...
    }
}

```
For this changes to take an effect reload nginx `sudo systemctl reload nginx`

---

# Location blocks
This of location blocks as intercepting a requests based on its value and then
doing something other than just trying to serve a matching file relative to the root directory.
```nginx
events {}
http {
    # ...
    server {
        # Prefix match 
        # /other... , for example /other-other, or even /other/other also match
        location /other {
            return 200 'This is prefix match example. /other, /other-other, /other/other will match.';
        }

        # Exact match 
        location = /exact {
            return 200 'This is exact match example. Only /exact will match.';
        }

        # Regex match 
        # `location ~ ...` - case sensitive
        # `location ~* ...` - case sensitive
        location ~* /h(i|ello) {
            return 200 'This is regex match example. /hi, /hello will match.';
        }

        # Preferential prefix match 
        # There is an priority by different match,
        # for example Regex match has higher priority than Prefix match
        # and Preferential prefix has higher priority than Regex match
        location ^~ /hi {
            return 200 'Preferential match. /hi, /hi-hi, /hi/hi will match.';
        }
    }
}

```

### Order of priorities
1. Exact match (`=`)
2. Preferential prefix match (`^~`)
3. Regex match (`~*`)
4. Prefix match ()

---

# Variables
Variables exist in two forms:
- Configuration Variables `set $var 'something'`
- NGINX Module Variables `$http`, `$uri`, `$args`
    - all variables are listed here: https://nginx.org/en/docs/varindex.html
    - ngx_http_core_module and ngx_http_log_module are part of nginx, no need to additionally install something

To check the value of the variables we can return the value

```nginx
events {}

http {
    include mime.types;
    server {
        listen      80;
        server_name localhost;
        root        /sites/demo;

        # - Custom variable example
        #   value can be integer, string or boolean 
        # - $host, $uri predefined and $args is query string 
        set $name "John";
        location /inspect {
            return 200 "host=$host,\nuri=$uri,\nargs=$args,\name=$name"
        }

    }
}
```

---

# Rewrites and Redirects
- `rewrite pattern URI`
- `return status URI`

If we redirect with `return` we send 307 and URI where to redirect
for example:
```nginx
events {}

http {
    include mime.types;
    server {
        listen      80;
        server_name localhost;
        root        /sites/demo;

        rewrite ^/incorrecturl/\w+ /inspect;

        location /inspect {
            # 307 is redirect 
            return 307 /sites.png
        }

    }
}
```
When we do `rewrite` it will be reevaluated again and go through the url.

---

# Try files
- `try_files path1 path2 finalPath;` - Allows engine check for resource to respond with any number of locations relative to the root
  For example, if path1 doens't exists go and check path2 if path2 doens't exist check finalPath, last path should be reliant.

```nginx
events {}

http {
    include mime.types;
    server {
        listen      80;
        server_name localhost;
        root        /sites/demo;

        # if /sites.png doesn't exist the request will be redirected to /inspect
        # try_files /sites.png /inspect;

        # @not-found is called `Named location`
        # instead of path we can use it as a reliant path
        try_files /sites.png /inspect @not_found;

        location @not_found {
            return 404 "The page you're looking for doesn't exists.";
        }

        location /inspect {
            # 307 is redirect 
            return 307 /sites.png
        }

    }
}
```

---

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

---

#### Checking if nginx configuration doesn't have any issues
```bash
sudo nginx -t
```

---

#### Configuration explanation
* `ssl_certificate` - specifies public key
* `ssl_certificate_key` - specifies private key


