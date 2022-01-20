typeset -g -A kubectx_mapping

function kubectx_prompt_info() {
  (( $+commands[kubectl] )) || return

<<<<<<< HEAD
  local current_ctx=$(kubectl config current-context 2> /dev/null)

  [[ -n "$current_ctx" ]] || return
=======
  local current_ctx=$(kubectl config current-context)
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)

  # use value in associative array if it exists
  # otherwise fall back to the context name
  echo "${kubectx_mapping[$current_ctx]:-${current_ctx:gs/%/%%}}"
}
