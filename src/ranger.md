## Close
 `q`, `:q`, `:quit` - Quit ranger
 `?k` - Show keybindings

## Working with files
 `cw` - Rename current file/directory
 `:mkdir test_dir` - create directory with name `test_dir`
 `:touch test.txt` - create directory with name `test.txt`
 `:delete` - delete selected or file/directory under cursor
 `yy` - Yank (copy) file
 `dd` - Mark file for cut operation
 `l` or `E` - Open file (opens file in default file-handler)
 `i` - Display file (useful if you'd like to view a text file in a pager instead of editing it)
 `r` - Open file with… (allows you to choose program to use)
 `o` - Change sort order (follow by character in menu selection)
 `z` - Change settings (commonly used toggle settings)
 `zh` - View hidden files
 `t` - Tag file (you can perform actions on tagged files)
 
## Selection
 `Shift+v` - select mode, to escape press `escape`
 `<space>` - Select current file
 `:unmark`, `uv` - Unselect all

## Search
 `/` - Search for files
 `n` - Jump to next match
 `N` - Jump to previous match

## Commands
 `:` - Command mode 
 `!` - Execute shell command

## Markers
 `m + <letter>` - Create Marker
 `um + <letter>` - Delete Marker
 `' + <letter>` - Delete Marker

## Using tabs
 `Ctrl+n` - open new tab
 `Tab` - go to next tab
 `Shift+Tab` - go to previous tab
 `Alt+n` - to to tab `n`, where `n` is a number of tab
 `Ctrl+w` - delete that tab

## Navigation
 `gh` - `cd ~`
 `ge` - `cd /etc`
 `gu` - `cd /usr`
 `gd` - `cd /dev`
 `go` - `cd /opt`
 `gv` - `cd /var`
 `gm` - `cd /media`
 `gM` - `cd /mnt`
 `gs` - `cd /srv`
 `gr` - `cd /`
 `gR` - `cd` to ranger's global configuration directory

## Configs
 `:set column_ratios 0` - Make two columns (remove the left one)
