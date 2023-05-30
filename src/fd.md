* `fd -t d` - Show all folders
* `fd -t f` - Show all files
* `fd -t d -d 1` - Show all folder that are at 1 level
* `fd --regex '.*(angular|react).*\.pdf'`, `fd "string|regex"` - Find all pdf files with words 'react' or 'angular' using regex
* `fd angular --extension pdf` - Find all files with word 'angular' and file extension pdf
* `fd angular ~` - Search for file or directory that contains angular word in a particular folder
* `fd --extension txt` - Search for files with extensions
* `fd "string|regex" path/to/directory` - Search in path
* `fd --hidden --no-ignore "string|regex"` - Include hidden files in the search results
* `fd "string|regex" --exec command` - Exec command on the search results
