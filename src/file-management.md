# Display content
* `less -N "<filename>"` - Show file content including the line numbers
* `cat filename` - Show file content, `CTRL+D` to leave

# Copy
* `cp -R <src-folder> <dest-folder>` - Full copy

# Modify
* `cat > filename` - Create file and add content, CTRL+D to leave
* `cat >> filename` - Append content, CTRL+D to leave. Create file in case file doesn't exist.

# Track
* `tail -F filename.log` - View file content in real time

# Rename (`rename` command is external)
* `rename 's/hello/test/' *.pdf` - rename in files word 'hello' to 'test'
* `rename 's/hello/test/' *.pdf -n` - print files that will be renamed later from 'hello' to 'test'
* `rename 's/from/to/' *.txt` - Rename all .txt files names from 'from' to 'to'
