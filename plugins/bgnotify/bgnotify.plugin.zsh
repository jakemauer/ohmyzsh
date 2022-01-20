#!/usr/bin/env zsh

<<<<<<< HEAD
## Setup

[[ -o interactive ]] || return # don't load on non-interactive shells
[[ -z "$SSH_CLIENT" && -z "$SSH_TTY" ]] || return # don't load on a SSH connection

zmodload zsh/datetime # faster than `date`


## Zsh Hooks

function bgnotify_begin {
  bgnotify_timestamp=$EPOCHSECONDS
  bgnotify_lastcmd="${1:-$2}"
}

function bgnotify_end {
  {
    local exit_status=$?
    local elapsed=$(( EPOCHSECONDS - bgnotify_timestamp ))

    # check time elapsed
    [[ $bgnotify_timestamp -gt 0 ]] || return
    [[ $elapsed -ge $bgnotify_threshold ]] || return

    # check if Terminal app is not active
    [[ $(bgnotify_appid) != "$bgnotify_termid" ]] || return

    printf '\a' # beep sound
    bgnotify_formatted "$exit_status" "$bgnotify_lastcmd" "$elapsed"
  } always {
    bgnotify_timestamp=0
  }
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec bgnotify_begin
add-zsh-hook precmd bgnotify_end


## Functions

# allow custom function override
(( ${+functions[bgnotify_formatted]} )) || \
function bgnotify_formatted {
  local exit_status=$1
  local cmd="$2"

  # humanly readable elapsed time
  local elapsed="$(( $3 % 60 ))s"
  (( $3 < 60 )) || elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
  (( $3 < 3600 )) || elapsed="$(( $3 / 3600 ))h $elapsed"

  if [[ $1 -eq 0 ]]; then
    bgnotify "#win (took $elapsed)" "$2"
  else
    bgnotify "#fail (took $elapsed)" "$2"
  fi
}

# for macOS, output is "app ID, window ID" (com.googlecode.iterm2, 116)
function bgnotify_appid {
  if (( ${+commands[osascript]} )); then
    osascript -e 'tell application (path to frontmost application as text) to get the {id, id of front window}' 2>/dev/null
  elif (( ${+commands[xprop]} )); then
    xprop -root _NET_ACTIVE_WINDOW 2>/dev/null | cut -d' ' -f5
  else
    echo $EPOCHSECONDS
  fi
}

function bgnotify {
  # $1: title, $2: message
  if (( ${+commands[terminal-notifier]} )); then # macOS
    local term_id="${bgnotify_termid%%,*}" # remove window id
=======
## setup ##

[[ -o interactive ]] || return #interactive only!
zmodload zsh/datetime || { print "can't load zsh/datetime"; return } # faster than date()
autoload -Uz add-zsh-hook || { print "can't add zsh hook!"; return }

(( ${+bgnotify_threshold} )) || bgnotify_threshold=5 #default 10 seconds


## definitions ##

if ! (type bgnotify_formatted | grep -q 'function'); then ## allow custom function override
  function bgnotify_formatted { ## args: (exit_status, command, elapsed_seconds)
    elapsed="$(( $3 % 60 ))s"
    (( $3 >= 60 )) && elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
    (( $3 >= 3600 )) && elapsed="$(( $3 / 3600 ))h $elapsed"
    [ $1 -eq 0 ] && bgnotify "#win (took $elapsed)" "$2" || bgnotify "#fail (took $elapsed)" "$2"
  }
fi

currentAppId () {
  if (( $+commands[osascript] )); then
    osascript -e 'tell application (path to frontmost application as text) to id' 2>/dev/null
  fi
}

currentWindowId () {
  if hash osascript 2>/dev/null; then #osx
    osascript -e 'tell application (path to frontmost application as text) to id of front window' 2&> /dev/null || echo "0"
  elif (hash notify-send 2>/dev/null || hash kdialog 2>/dev/null); then #ubuntu!
    xprop -root 2> /dev/null | awk '/NET_ACTIVE_WINDOW/{print $5;exit} END{exit !$5}' || echo "0"
  else
    echo $EPOCHSECONDS #fallback for windows
  fi
}

bgnotify () { ## args: (title, subtitle)
  if hash terminal-notifier 2>/dev/null; then #osx
    local term_id="$bgnotify_appid"
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    if [[ -z "$term_id" ]]; then
      case "$TERM_PROGRAM" in
      iTerm.app) term_id='com.googlecode.iterm2' ;;
      Apple_Terminal) term_id='com.apple.terminal' ;;
      esac
    fi

<<<<<<< HEAD
    if [[ -z "$term_id" ]]; then
      terminal-notifier -message "$2" -title "$1" &>/dev/null
    else
      terminal-notifier -message "$2" -title "$1" -activate "$term_id" -sender "$term_id" &>/dev/null
    fi
  elif (( ${+commands[growlnotify]} )); then # macOS growl
    growlnotify -m "$1" "$2"
  elif (( ${+commands[notify-send]} )); then # GNOME
    notify-send "$1" "$2"
  elif (( ${+commands[kdialog]} )); then # KDE
    kdialog --title "$1" --passivepopup  "$2" 5
  elif (( ${+commands[notifu]} )); then # cygwin
=======
    ## now call terminal-notifier, (hopefully with $term_id!)
    if [[ -z "$term_id" ]]; then
      terminal-notifier -message "$2" -title "$1" >/dev/null
    else
      terminal-notifier -message "$2" -title "$1" -activate "$term_id" -sender "$term_id" >/dev/null
    fi
  elif hash growlnotify 2>/dev/null; then #osx growl
    growlnotify -m "$1" "$2"
  elif hash notify-send 2>/dev/null; then #ubuntu gnome!
    notify-send "$1" "$2"
  elif hash kdialog 2>/dev/null; then #ubuntu kde!
    kdialog --title "$1" --passivepopup  "$2" 5
  elif hash notifu 2>/dev/null; then #cygwyn support!
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    notifu /m "$2" /p "$1"
  fi
}

<<<<<<< HEAD
## Defaults

# notify if command took longer than 5s by default
bgnotify_threshold=${bgnotify_threshold:-5}

# bgnotify_appid is slow in macOS and the terminal ID won't change, so cache it at startup
bgnotify_termid="$(bgnotify_appid)"
=======

## Zsh hooks ##

bgnotify_begin() {
  bgnotify_timestamp=$EPOCHSECONDS
  bgnotify_lastcmd="${1:-$2}"
  bgnotify_appid="$(currentAppId)"
  bgnotify_windowid=$(currentWindowId)
}

bgnotify_end() {
  didexit=$?
  elapsed=$(( EPOCHSECONDS - bgnotify_timestamp ))
  past_threshold=$(( elapsed >= bgnotify_threshold ))
  if (( bgnotify_timestamp > 0 )) && (( past_threshold )); then
    if [[ $(currentAppId) != "$bgnotify_appid" || $(currentWindowId) != "$bgnotify_windowid" ]]; then
      print -n "\a"
      bgnotify_formatted "$didexit" "$bgnotify_lastcmd" "$elapsed"
    fi
  fi
  bgnotify_timestamp=0 #reset it to 0!
}

## only enable if a local (non-ssh) connection
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
  add-zsh-hook preexec bgnotify_begin
  add-zsh-hook precmd bgnotify_end
fi
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
