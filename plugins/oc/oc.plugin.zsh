# Autocompletion for oc, the command line interface for OpenShift
#
# Author: https://github.com/kevinkirkup

if [ $commands[oc] ]; then
  source <(oc completion zsh)
<<<<<<< HEAD
  compdef _oc oc
=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
fi
