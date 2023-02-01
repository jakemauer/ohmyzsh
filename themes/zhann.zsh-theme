autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
<<<<<<< HEAD
zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' formats ' [%b%F{1}:%F{11}%i%c%u%B%F{green}]'
zstyle ':vcs_info:*' enable git svn

theme_precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    zstyle ':vcs_info:git:*' formats ' [%b%c%u%B%F{green}]'
  else
    zstyle ':vcs_info:git:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
  fi

  vcs_info
=======
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
}

setopt prompt_subst
PROMPT='%B%F{blue}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}% '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

