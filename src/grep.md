* `grep "<text>" <filename>` - Search for <text> in the file <filename>
* `grep -wi "in"` - Search for 'in' word but not as a part of another word and use for search ignore case
* `grep -winr "in"` - Search for word 'in', with ignore case, line numbers, and recursively
* `grep -wirl "in"` - Search for word 'in', with ignore case, recursively, and show file name instead of occurrence
* `grep -P "\d{3}-\d{3}-\d{4}" <filename>.txt` - Search for occurrence using the regex
* `pgrep <process_name>` - Search for a process id (PID) by process name
* `history | grep  <text>` - Find command by text in the history
* `ps aux | grep 'telegram|%cpu'` - Search for process by name (%cpu is here because we want to see the header)
* `ps aux | grep nginx` - Check whether nginx process is running
* `netstat -rn | grep -P "default|UG"` - Show router ip address
