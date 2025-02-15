autoload -Uz is-at-least

# *-magic is known buggy in some versions; disable if so
if [[ $DISABLE_MAGIC_FUNCTIONS != true ]]; then
  for d in $fpath; do
    if [[ -e "$d/url-quote-magic" ]]; then
      if is-at-least 5.1; then
        autoload -Uz bracketed-paste-magic
        zle -N bracketed-paste bracketed-paste-magic
      fi
      autoload -Uz url-quote-magic
      zle -N self-insert url-quote-magic
    break
    fi
  done
fi

## jobs
setopt long_list_jobs

env_default 'PAGER' 'less'
env_default 'LESS' '-R'

## super user alias
alias _='sudo '

<<<<<<< HEAD
## more intelligent acking for ubuntu users and no alias for users without ack
if (( $+commands[ack-grep] )); then
  alias afind='ack-grep -il'
elif (( $+commands[ack] )); then
=======
## more intelligent acking for ubuntu users
if (( $+commands[ack-grep] )); then
  alias afind='ack-grep -il'
else
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
  alias afind='ack -il'
fi

# recognize comments
setopt interactivecomments
