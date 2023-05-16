# Display content
* `less -N "<filename>"` - Show file content including the line numbers
* `cat filename` - Show file content, `CTRL+D` to leave

# Copy
* `cp -R <src-folder> <dest-folder>` - Full copy

# Find
* `locate -i <filename>` - Find file with the name using ignore case
* `find . -iname "*<filename>*"` - Find file in the current location by regular expression and ignore case
* `find . -type d -iname vim` - Search for directory with name vim (-f to search for file)
* `find ./folder/other -iregex '.*text.*\.pdf$'` - Find file or folder using the ignore case and regular expression

# Modify
* `cat > filename` - Create file and add content, CTRL+D to leave
* `cat >> filename` - Append content, CTRL+D to leave

# Track
* `tail -F filename.log` - View file content in real time

# Rename
* `rename 's/hello/test/' *.pdf` - rename in files word 'hello' to 'test'
* `rename 's/hello/test/' *.pdf -n` - print files that will be renamed later from 'hello' to 'test'
* `rename 's/from/to/' *.txt` - Rename all .txt files names from 'from' to 'to'
