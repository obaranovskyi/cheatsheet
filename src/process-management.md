# Getting information
* `ps` - Display processes that are running in the current session
* `ps aux` - Display all running processes with detailed information.
```
`USER` - Username of the process owner.
`TTY`- terminal type
`TIME+` - total time the process has been running
`CMD`	- name of the command that launches the process
`%CPU` - Percentage of CPU used by the process
`%MEM` - Percentage of RAM used by the process
`S` - state of the process
    `D` - uninterruptible sleep
    `R` - running
    `S` - sleeping
    `T` - traced or stopped
    `Z` - zombie
```
* `ps -f 1` - Find process by PID
* `ps -u` - Dispay process list by real user Id or name
* `top`, `htop`, `bpython`, `vtop` - Display running processes
* `sleep 1` - Sleep 1 second
* `lsof -i :8000` - Find process including PID details which runs on port 8000

# Search for Process
* `ps aux | grep nxinx` - Search for a process id (PID) by process name
* `pgrep <process_name>` - Search for a process id (PID) by process name

# Foreground and background the process
* `sleep 300 &` - Run `sleep` command in the background
* `jobs` - Display status of jobs in the current session. It might be needed to display suspended processes.
* `jobs -l` - Display status of jobs with the additional information, such as PID
* `jobs -r` - Display running jobs
* `jobs -s` - Display stopped jobs
* `fg %1` - Foreground the process, `%1` is the job nuber, it is shown at the very beginning
* `Ctrl+z` - Suspend the process

# Killing the process
* `kill -l` - Display a list of signals in your terminal
* `kill -15 4664` - Terminate the process by PID in the most common way, `-15` is `SIGNTERM`
* `kill -9 4666` - Terminate the process by PID in hard way by sending signal to kernel, `-9` is `SIGKILL`
* `killall telegram` - Kill all processes named 'telegram'
* `pkill <process_name>` - Terminate process by name
* `Ctrl+c` - `SIGINT`
* `Ctrl+\` - `SIGQUIT`
