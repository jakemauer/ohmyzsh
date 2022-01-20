#####################################################
# gcloud plugin for oh-my-zsh                       #
# Author: Ian Chesal (github.com/ianchesal)         #
#####################################################

if [[ -z "${CLOUDSDK_HOME}" ]]; then
  search_locations=(
    "$HOME/google-cloud-sdk"
    "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
    "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
    "/usr/share/google-cloud-sdk"
    "/snap/google-cloud-sdk/current"
<<<<<<< HEAD
    "/usr/lib/google-cloud-sdk"
    "/usr/lib64/google-cloud-sdk"
    "/opt/google-cloud-sdk"
    "/opt/local/libexec/google-cloud-sdk"
=======
    "/usr/lib64/google-cloud-sdk/"
    "/opt/google-cloud-sdk"
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
  )

  for gcloud_sdk_location in $search_locations; do
    if [[ -d "${gcloud_sdk_location}" ]]; then
      CLOUDSDK_HOME="${gcloud_sdk_location}"
      break
    fi
  done
<<<<<<< HEAD
  unset search_locations gcloud_sdk_location
fi

if (( ${+CLOUDSDK_HOME} )); then
  # Only source this if gcloud isn't already on the path
  if (( ! $+commands[gcloud] )); then
=======
fi

if (( ${+CLOUDSDK_HOME} )); then
  if (( ! $+commands[gcloud] )); then
    # Only source this if GCloud isn't already on the path
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    if [[ -f "${CLOUDSDK_HOME}/path.zsh.inc" ]]; then
      source "${CLOUDSDK_HOME}/path.zsh.inc"
    fi
  fi
<<<<<<< HEAD

  # Look for completion file in different paths
  for comp_file (
    "${CLOUDSDK_HOME}/completion.zsh.inc"             # default location
    "/usr/share/google-cloud-sdk/completion.zsh.inc"  # apt-based location
  ); do
    if [[ -f "${comp_file}" ]]; then
      source "${comp_file}"
      break
    fi
  done
  unset comp_file

=======
  source "${CLOUDSDK_HOME}/completion.zsh.inc"
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
  export CLOUDSDK_HOME
fi
