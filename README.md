# cheatsheet

## Installation
1. Install first [bat](https://github.com/sharkdp/bat) 
2. Add to you .bashrc
```bash
repo_name='obaranovskyi/cheatsheet'
url='https://github.com'
raw_url='https://raw.githubusercontent.com'
main_src='main/src'


function cheatsheet() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  value=$(echo $value | sed -e 's/404: Not Found//g')

  if [ ! -z "$value" ]
  then
    if ! command -v bat &> /dev/null
    then
      echo "$value"
    else
      echo "$value" | bat -l 'markdown' -n
    fi
  fi
}

function cheatsheet_list() {
  local value=$(
    curl -s "${url}/${repo_name}/tree/${main_src}" | \
    grep '>.*\.md<' |                               \
    sed -e 's/<[^>]*>//g' |                         \
    sed -e 's/\.md//g' |                            \
    awk '{print $1}'
  )
  echo "$value"
}

alias cs="cheatsheet"
alias csl="cheatsheet_list"
```
3. Run 
```bash
cs docker
```


