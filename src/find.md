* `find . -iname "*<filename>*"` - Find file in the current location by using wildcard and ignore case
* `find . -type d -iname vim` - Search for directory with name vim (-f to search for file)
* `find ./folder/other -iregex '.*text.*\.pdf$'` - Find file or folder using the ignore case and regular expression
* `find . -iname "*.pdf" -exec cp "{}" ./path/where/to/copy \;`
