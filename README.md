# cheatsheet

### Installation


```bash
wget -O - https://raw.githubusercontent.com/obaranovskyi/cheatsheet/main/cheatsheet.sh >> ~/.bashrc
```

### Manual installation

Add to you `.bashrc`:

```bash
repo_name='obaranovskyi/cheatsheet'
url='https://github.com'
raw_url='https://raw.githubusercontent.com'
main_src='main/src'


function cheatsheet() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")

  if [[ ! $value == *"404: Not Found"* ]]; then
    if ! command -v bat &> /dev/null
    then
      more $value
    else
      echo "$value" | bat -l 'markdown' -n
    fi
  fi

}

function cheatsheet_list() {
  local value=$(
    curl -s "${url}/${repo_name}/tree/${main_src}" | \
    grep '>.*\.md<'                                | \
    sed -e 's/<[^>]*>//g'                          | \
    sed -e 's/\.md//g'                             | \
    awk '{print $1}'
  )
  echo "$value"
}

alias cs="cheatsheet"
alias csl="cheatsheet_list"


cs-help() {
    echo "\n${COLOR_YELLOW}  Cheatsheet:";
    echo "${COLOR_BLUE}  cs <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name>"
    echo "${COLOR_BLUE}  csl ${COLOR_GREEN}- display the list of cheat sheets that can be searched for"
}
```

### Commands

**Note** If you want to have colored markdown output install [bat](https://github.com/sharkdp/bat)

- `csl` - display available cheat sheets
- `cs <app-name>` - display cheat sheet for `<app-name>`

