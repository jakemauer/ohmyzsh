# See https://github.com/nvm-sh/nvm#installation-and-update
if [[ -z "$NVM_DIR" ]]; then
  if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
  elif [[ -d "${XDG_CONFIG_HOME:-$HOME/.config}/nvm" ]]; then
    export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
<<<<<<< HEAD
  elif (( $+commands[brew] )); then
    NVM_HOMEBREW="${NVM_HOMEBREW:-${HOMEBREW_PREFIX:-$(brew --prefix)}/opt/nvm}"
    if [[ -d "$NVM_HOMEBREW" ]]; then
      export NVM_DIR="$NVM_HOMEBREW"
    fi
=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
  fi
fi

# Don't try to load nvm if command already available
<<<<<<< HEAD
# Note: nvm is a function so we need to use `which`
which nvm &>/dev/null && return

# TODO: 2022-11-11: Remove soft-deprecate options
if (( ${+NVM_LAZY} + ${+NVM_LAZY_CMD} + ${+NVM_AUTOLOAD} )); then
  # Get list of NVM_* variable settings defined
  local -a used_vars
  used_vars=(${(o)parameters[(I)NVM_(AUTOLOAD|LAZY|LAZY_CMD)]})
  # Nicely print the list in the style `var1, var2 and var3`
  echo "${fg[yellow]}[nvm plugin] Variable-style settings are deprecated. Instead of ${(j:, :)used_vars[1,-2]}${used_vars[-2]+ and }${used_vars[-1]}, use:\n"
  if (( $+NVM_AUTOLOAD )); then
    echo "  zstyle ':omz:plugins:nvm' autoload yes"
    zstyle ':omz:plugins:nvm' autoload yes
  fi
  if (( $+NVM_LAZY )); then
    echo "  zstyle ':omz:plugins:nvm' lazy yes"
    zstyle ':omz:plugins:nvm' lazy yes
  fi
  if (( $+NVM_LAZY_CMD )); then
    echo "  zstyle ':omz:plugins:nvm' lazy-cmd $NVM_LAZY_CMD"
    zstyle ':omz:plugins:nvm' lazy-cmd $NVM_LAZY_CMD
  fi
  echo "$reset_color"
  unset used_vars NVM_AUTOLOAD NVM_LAZY NVM_LAZY_CMD
fi

if zstyle -t ':omz:plugins:nvm' lazy; then
  # Call nvm when first using nvm, node, npm, pnpm, yarn or other commands in lazy-cmd
  zstyle -a ':omz:plugins:nvm' lazy-cmd nvm_lazy_cmd
  eval "
    function nvm node npm pnpm yarn $nvm_lazy_cmd {
      unfunction nvm node npm pnpm yarn $nvm_lazy_cmd
      # Load nvm if it exists in \$NVM_DIR
      [[ -f \"\$NVM_DIR/nvm.sh\" ]] && source \"\$NVM_DIR/nvm.sh\"
      \"\$0\" \"\$@\"
    }
  "
  unset nvm_lazy_cmd
elif [[ -f "$NVM_DIR/nvm.sh" ]]; then
  # Load nvm if it exists in $NVM_DIR
  source "$NVM_DIR/nvm.sh"
else
  return
=======
which nvm &> /dev/null && return

if [[ -f "$NVM_DIR/nvm.sh" ]]; then
  # Load nvm if it exists in $NVM_DIR
  source "$NVM_DIR/nvm.sh" ${NVM_LAZY+"--no-use"}
else
  # Otherwise try to load nvm installed via Homebrew
  # User can set this if they have an unusual Homebrew setup
  NVM_HOMEBREW="${NVM_HOMEBREW:-/usr/local/opt/nvm}"
  # Load nvm from Homebrew location if it exists
  if [[ -f "$NVM_HOMEBREW/nvm.sh" ]]; then
    source "$NVM_HOMEBREW/nvm.sh" ${NVM_LAZY+"--no-use"}
  else
    # Exit the plugin if we couldn't find nvm
    return
  fi
fi

# Call nvm when first using node, npm or yarn
if (( $+NVM_LAZY )); then
  function node npm yarn $NVM_LAZY_CMD {
    unfunction node npm yarn $NVM_LAZY_CMD
    nvm use default
    command "$0" "$@"
  }
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
fi

# Autoload nvm when finding a .nvmrc file in the current directory
# Adapted from: https://github.com/nvm-sh/nvm#zsh
<<<<<<< HEAD
if zstyle -t ':omz:plugins:nvm' autoload; then
  function load-nvmrc {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"
    local nvm_silent=""
    zstyle -t ':omz:plugins:nvm' silent-autoload && nvm_silent="--silent"

    if [[ -n "$nvmrc_path" ]]; then
      local nvmrc_node_version=$(nvm version $(cat "$nvmrc_path" | tr -dc '[:print:]'))
=======
if (( $+NVM_AUTOLOAD )); then
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [[ -n "$nvmrc_path" ]]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)

      if [[ "$nvmrc_node_version" = "N/A" ]]; then
        nvm install
      elif [[ "$nvmrc_node_version" != "$node_version" ]]; then
<<<<<<< HEAD
        nvm use $nvm_silent
      fi
    elif [[ "$node_version" != "$(nvm version default)" ]]; then
      if [[ -z $nvm_silent ]]; then
        echo "Reverting to nvm default version"
      fi

      nvm use default $nvm_silent
=======
        nvm use
      fi
    elif [[ "$node_version" != "$(nvm version default)" ]]; then
      echo "Reverting to nvm default version"
      nvm use default
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook chpwd load-nvmrc

  load-nvmrc
fi

# Load nvm bash completion
for nvm_completion in "$NVM_DIR/bash_completion" "$NVM_HOMEBREW/etc/bash_completion.d/nvm"; do
  if [[ -f "$nvm_completion" ]]; then
    # Load bashcompinit
    autoload -U +X bashcompinit && bashcompinit
    # Bypass compinit call in nvm bash completion script. See:
    # https://github.com/nvm-sh/nvm/blob/4436638/bash_completion#L86-L93
    ZSH_VERSION= source "$nvm_completion"
    break
  fi
done

<<<<<<< HEAD
unset NVM_HOMEBREW nvm_completion
=======
unset NVM_HOMEBREW NVM_LAZY NVM_AUTOLOAD nvm_completion
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
