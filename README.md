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

function cs() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value"
  fi
}

function csbat() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value" | bat -l 'markdown' -n
  fi
}

function csglow() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value" | glow
  fi
}

function csless() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value" | less
  fi
}

function csl() {
  printf "$(curl -s "${raw_url}/${repo_name}/main/content.md")"
}
```


### Commands

**Note** If you want to have colored markdown output install [glow](https://github.com/charmbracelet/glow)

- `csl` - display available cheat sheets
- `cs <app-name>` - display cheat sheet for `<app-name>`
- `csbat <app-name>` - display cheat sheet for `<app-name>` using `bat` app
- `csglow <app-name>` - display cheat sheet for `<app-name>` using `glow` app
- `csless <app-name>` - display cheat sheet for `<app-name>` using `less` app

