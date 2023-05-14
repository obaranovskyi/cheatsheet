repo_name='obaranovskyi/cheatsheet'
url='https://github.com'
raw_url='https://raw.githubusercontent.com'
main_src='main/src'

function cheatsheet() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")

  if [[ ! $value == *"404: Not Found"* ]]; then
    if ! command -v bat &> /dev/null
    then
      echo "$value" | less
    else
      echo "$value" | bat -l 'markdown' -n
    fi
  fi
}

function cheatsheet_list() {
  local values=$(curl -s "${raw_url}/${repo_name}/main/content.md")
  echo $values
}

alias cs="cheatsheet"
alias csl="cheatsheet_list"


cs-help() {
    echo "\n${COLOR_YELLOW}  Cheatsheet:";
    echo "${COLOR_BLUE}  cs <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name>"
    echo "${COLOR_BLUE}  csl ${COLOR_GREEN}- display the list of cheat sheets that can be searched for"
}
