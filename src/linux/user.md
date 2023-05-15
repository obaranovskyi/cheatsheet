# Display list of users
- `less /etc/passwd`

# Create user
- `sudo useradd obaranovskyi`
- `sudo passwd username`

# Remove user
- `userdel obaranovskyi --force`

---

# Switch to other user
```bash
su obaranovskyi
```

---

# Give root privilege through `sudoers` file
- Open file `/etc/sudoers`
- Add your user to this line `root ALL=(ALL) ALL` so it'll look like this `root, obaranovskyi ALL=(ALL) ALL` 
Note: we can add another line `obaranovksyi ALL=(ALL) ALL`, this will work as well


# Give root privilege through command

### Check what privilege groups do we have:
```bash
groups
```

### Check user groups
```bash
groups obaranovskyi
```

### Adding user to root group
```bash
sudo usermod -a -G root obaranovskyi
```
here `root` is a group name

# Switch to root user
`sudo su –`, `sudo -i`, and `sudo – s` commands switch the normal user to the root user
