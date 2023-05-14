# cheatsheet

### Installation


```bash
wget -O - https://raw.githubusercontent.com/obaranovskyi/cheatsheet/main/cheatsheet.sh >> ~/.bashrc && \
source .bashrc
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
    if ! command -v glow &> /dev/null
    then
      echo "$value" | less
    else
      echo $value | glow
    fi
  fi
}

function cheatsheet_list() {
  local values=$(curl -s "${raw_url}/${repo_name}/main/content.md")
  echo $values
}

alias cs="cheatsheet"
alias csl="cheatsheet_list"
```

### Commands

**Note** If you want to have colored markdown output install [bat](https://github.com/sharkdp/bat)

- `csl` - display available cheat sheets
- `cs <app-name>` - display cheat sheet for `<app-name>`

