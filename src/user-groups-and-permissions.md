# Check file permissions and ownership:
```bash
ls -l text.txt
```

```
drw-rw-r--   1  obaranovskyi staff 18 2020-07-17    17:18 text.txt
```

- `drw-rw-r--` - file permissions
- `obaranovskyi` - owner
- `staff` - group

# File permissions:
* User - File owner.
* Group - A file can be owned by a group of users. 
  Everyone in the group will have the same permissions.
* Other - Everyone else, or permissions for the world.


# Characters representing the permissions
- `r` - Read permissions
- `w` - Write permissions
- `x` - Execute permissions
- `-` - No permissions

# Absolute/Numeric mode 
```
+---------+------------------------+--------+
| Number  | Permission Type        | Symbol |
+---------+------------------------+--------+
| 0       | No Permissions         | -      |
+---------+------------------------+--------+
| 1       | Execute                | -x     |
+---------+------------------------+--------+
| 2       | Write                  | -w-    |
+---------+------------------------+--------+
| 3       | Execute + Write        | -wx    |
+---------+------------------------+--------+
| 4       | Read                   | r-     |
+---------+------------------------+--------+
| 5       | Read + Execute         | r-x    |
+---------+------------------------+--------+
| 6       | Read + Write           | rw-    |
+---------+------------------------+--------+
| 7       | Read + Write + Execute | rwx    |
+---------+------------------------+--------+
```

## Using `chmod`

#### Symbolic mode
* `+` - Adds a permission to a file or directory
* `-` - Removes the permission
* `=` Sets the permissions or overrides the permissions that were set earlier.

#### User denotations
* `u` - user/owner
* `g` - group
* `o` - other
* `a` - all

a few example:
```bash
chmod o=rwx text.txt # set permissions to the others
chmod g+x text.txt   # add execute permissions to the group
chmod u-r text.txt   # remove read permission for the user
```

## Using `chown` to change ownership
```bash
chown user filename         # Changing the ownership of a file or directory
chown user:group filename   # Changing user and group ownership
```

a few examples:
```bash
sudo chown obaranovskyi text.txt    # Changing the file ownership to `obaranovskyi` 
```

## Using `chgrp` to change group
```bash
sudo chgrp obaranovskyi text.txt
```
**Note:** to print existing groups type `groups`.

