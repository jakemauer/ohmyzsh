# Some useful commands for setting permissions.
#
# Rory Hardy [GneatGeek]
# Andrew Janke [apjanke]

### Aliases

# Set all files' permissions to 644 recursively in a directory
<<<<<<< HEAD
function set644 {
=======
set644() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
	find "${@:-.}" -type f ! -perm 644 -print0 | xargs -0 chmod 644
}

# Set all directories' permissions to 755 recursively in a directory
<<<<<<< HEAD
function set755 {
=======
set755() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
	find "${@:-.}" -type d ! -perm 755 -print0 | xargs -0 chmod 755
}

### Functions

<<<<<<< HEAD
# resetperms - fix permissions on files and directories, with confirmation
# Returns 0 on success, nonzero if any errors occurred
function resetperms {
=======
# fixperms - fix permissions on files and directories, with confirmation
# Returns 0 on success, nonzero if any errors occurred
fixperms () {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
  local opts confirm target exit_status chmod_opts use_slow_mode
  zparseopts -E -D -a opts -help -slow v+=chmod_opts
  if [[ $# > 1 || -n "${opts[(r)--help]}" ]]; then
    cat <<EOF
<<<<<<< HEAD
Usage: resetperms [-v] [--help] [--slow] [target]
=======
Usage: fixperms [-v] [--help] [--slow] [target]
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)

  target  is the file or directory to change permissions on. If omitted,
          the current directory is taken to be the target.

  -v      enables verbose output (may be supplied multiple times)

  --slow  will use a slower but more robust mode, which is effective if
          directories themselves have permissions that forbid you from
          traversing them.

EOF
    exit_status=$(( $# > 1 ))
    return $exit_status
  fi

<<<<<<< HEAD
  if [[ $# -eq 0 ]]; then
=======
  if [[ $# == 0 ]]; then
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    target="."
  else
    target="$1"
  fi
  if [[ -n ${opts[(r)--slow]} ]]; then use_slow=true; else use_slow=false; fi

  # Because this requires confirmation, bail in noninteractive shells
  if [[ ! -o interactive ]]; then
<<<<<<< HEAD
    echo "resetperms: cannot run in noninteractive shell"
=======
    echo "fixperms: cannot run in noninteractive shell"
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    return 1
  fi

  echo "Fixing perms on $target?"
  printf '%s' "Proceed? (y|n) "
  read confirm
  if [[ "$confirm" != y ]]; then
    # User aborted
    return 1
  fi

  # This xargs form is faster than -exec chmod <N> {} \; but will encounter
  # issues if the directories themselves have permissions such that you can't
  # recurse in to them. If that happens, just rerun this a few times.
  exit_status=0;
  if [[ $use_slow == true ]]; then
    # Process directories first so non-traversable ones are fixed as we go
    find "$target" -type d ! -perm 755 -exec chmod $chmod_opts 755 {} \;
<<<<<<< HEAD
    if [[ $? -ne 0 ]]; then exit_status=$?; fi
    find "$target" -type f ! -perm 644 -exec chmod $chmod_opts 644 {} \;
    if [[ $? -ne 0 ]]; then exit_status=$?; fi
  else
    find "$target" -type d ! -perm 755 -print0 | xargs -0 chmod $chmod_opts 755
    if [[ $? -ne 0 ]]; then exit_status=$?; fi
    find "$target" -type f ! -perm 644 -print0 | xargs -0 chmod $chmod_opts 644
    if [[ $? -ne 0 ]]; then exit_status=$?; fi
=======
    if [[ $? != 0 ]]; then exit_status=$?; fi
    find "$target" -type f ! -perm 644 -exec chmod $chmod_opts 644 {} \;
    if [[ $? != 0 ]]; then exit_status=$?; fi
  else
    find "$target" -type d ! -perm 755 -print0 | xargs -0 chmod $chmod_opts 755
    if [[ $? != 0 ]]; then exit_status=$?; fi
    find "$target" -type f ! -perm 644 -print0 | xargs -0 chmod $chmod_opts 644
    if [[ $? != 0 ]]; then exit_status=$?; fi
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
  fi
  echo "Complete"
  return $exit_status
}
<<<<<<< HEAD

function fixperms {
  print -ru2 "fixperms has been deprecated. Use resetperms instead"
  return 1
}
=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
