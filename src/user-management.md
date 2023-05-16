* `useradd` - By using this command, you can create a new user account on the system.
* `usermod` - This command is used to modify an existing user account, such as changing the user's password or group membership.
* `userdel` - This command is used to delete an existing user account from the system.
* `passwd` - This command is used to change a user's password.
* `groupadd` - This command is used to create a new group on the system.
* `groupmod` - This command is used to modify an existing group, such as changing the group's name or membership.
* `groupdel` - This command is used to delete an existing group from the system.
* `id` - This command is used to display information about a user or group, including their user ID and group membership.
* `chown` - This command is used to change the owner of a file or directory.
* `chgrp` - This command is used to change the group ownership of a file or directory.
* `chmod` - This command is used to change the permissions of a file or directory.
* `su` - This command is used to switch to another user account or become a superuser. (`su -`, `su -i` to root user)
* `sudo` - This command is used to execute a command with elevated privileges.
* `whoami` - This command is used to display the username of the current user.
* `w` - This command is used to display information about logged-in users and their activity on the system.
* `finger [username]` - Displays detailed information about a user, including their login name, home directory, and shell.
* `last` - Displays information about the last logged-in users on the system.
* `who` - Displays information about currently logged-in users in the system.
* `adduser [username]` - Create a new user account with interactive prompts to enter user details.
* `deluser [username]` - Deletes a user account and their home directory from the system.
* `newgrp [groupname]` - Change the user's primary group membership to a new session.
* `usermod -aG [groupname] [username]` - Adds a user to an additional group.
* `chsh -s [shellpath] [username]` - Change the user's login shell.
* `chfn [username]` - Change the user's full name and other details in the system password file.
* `visudo` - Edit the sudo configuration file, which controls which users can execute commands with elevated privileges.
* `less /etc/passwd` - Display available users
* `sudo cs` - Repeat last command with root user

# Give root privilege through `sudoers` file
- Open file `/etc/sudoers`
- Add your user to this line `root ALL=(ALL) ALL` so it'll look like this `root, obaranovskyi ALL=(ALL) ALL` 
Note: we can add another line `obaranovksyi ALL=(ALL) ALL`, this will work as well


# Create/Remove user
- `sudo useradd obaranovskyi`
- `sudo passwd username`

Note: to remove user run `userdel obaranovskyi --force`
