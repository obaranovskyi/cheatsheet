# `locate`
* `locate -i <filename>` - Find file with the name using ignore case

# `find`
* `find . -iname "*<filename>*"` - Find file in the current location by regular expression and ignore case
* `find . -type d -iname vim` - Search for directory with name vim (-f to search for file)
* `find ./folder/other -iregex '.*text.*\.pdf$'` - Find file or folder using the ignore case and regular expression

# `grep`
* `grep "<text>" <filename>` - Search for <text> in the file <filename>
* `ps aux | grep 'telegram|%cpu'` - Search for process by name (%cpu is here because we want to see the header)
* `grep -wi "in"` - Search for 'in' word but not as a part of another word and use for search ignore case
* `grep -winr "in"` - Search for word 'in', with ignore case, line numbers, and recursively
* `grep -wirl "in"` - Search for word 'in', with ignore case, recursively, and show file name instead of occurrence
* `grep -P "\d{3}-\d{3}-\d{4}" <filename>.txt` - Search for occurrence using the regex
* `netstat -rn | grep -P "default|UG"` - Show router ip address
* `pgrep <process_name>` - Search for a process id (PID) by process name
* `ps aux | grep nginx` - Check whether nginx process is running
* `history | grep  <text>` - Find command by text in the history


