# Set shell to bash
- `echo $SHELL` - display the shell that you're using
- `chsh -s /usr/local/bin/bash`  - change bash to your login shell
   If you get `invalid shell` error, then the given path needs to be added to the `/etc/shells` file.
- `cat /etc/shells` To check what shells are available:
- `declare -p BASH_VERSION`, `bash --version` - check bash version.
  Shouldn't be less then 4.0, otherwise install using `brew` and check if it's in the `/etc/shells`.

