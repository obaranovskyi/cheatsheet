# Give root privilege through `sudoers` file
- Open file `/etc/sudoers`
- Add your user to this line `root ALL=(ALL) ALL` so it'll look like this `root, obaranovskyi ALL=(ALL) ALL` 
Note: we can add another line `obaranovksyi ALL=(ALL) ALL`, this will work as well

# Give root privilege through command
* `groups` - Check what privilege groups exist 
* `groups obaranovskyi` - Check user groups
* `sudo usermod -a -G root obaranovskyi` - Adding user to root group

# Switch to root user
`sudo su –`, `sudo -i`, and `sudo – s` commands switch the normal user to the root user
