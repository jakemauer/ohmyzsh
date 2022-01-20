if (( ! $+commands[helm] )); then
  return
fi

<<<<<<< HEAD
# If the completion file does not exist, generate it and then source it
# Otherwise, source it and regenerate in the background
if [[ ! -f "$ZSH_CACHE_DIR/completions/_helm" ]]; then
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null
  source "$ZSH_CACHE_DIR/completions/_helm"
else
  source "$ZSH_CACHE_DIR/completions/_helm"
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null &|
fi

alias h='helm'
alias hin='helm install'
alias hse='helm search'
alias hup='helm upgrade'
=======
# TODO: 2021-12-28: delete this block
# Remove old generated file
command rm -f "${ZSH_CACHE_DIR}/helm_completion"

# TODO: 2021-12-28: remove this bit of code as it exists in oh-my-zsh.sh
# Add completions folder in $ZSH_CACHE_DIR
command mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# If the completion file does not exist, generate it and then source it
# Otherwise, source it and regenerate in the background
if [[ ! -f "$ZSH_CACHE_DIR/completions/_helm" ]]; then
  helm completion zsh >| "$ZSH_CACHE_DIR/completions/_helm"
  source "$ZSH_CACHE_DIR/completions/_helm"
else
  source "$ZSH_CACHE_DIR/completions/_helm"
  helm completion zsh >| "$ZSH_CACHE_DIR/completions/_helm" &|
fi
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
