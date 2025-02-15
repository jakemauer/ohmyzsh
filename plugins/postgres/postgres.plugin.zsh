# Aliases to control Postgres
# Paths noted below are for Postgres installed via Homebrew on OSX
<<<<<<< HEAD
if (( ! $+commands[brew] )); then
  return
fi

local PG_BREW_DIR=$(brew --prefix)/var/postgres

alias startpost="pg_ctl -D $PG_BREW_DIR -l $PG_BREW_DIR/server.log start"
alias stoppost="pg_ctl -D $PG_BREW_DIR stop -s -m fast"
alias restartpost="stoppost && sleep 1 && startpost"
alias reloadpost="pg_ctl reload -D $PG_BREW_DIR -s"
alias statuspost="pg_ctl status -D $PG_BREW_DIR -s"
=======

alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias restartpost='stoppost && sleep 1 && startpost'
alias reloadpost='pg_ctl reload -D /usr/local/var/postgres -s'
alias statuspost='pg_ctl status -D /usr/local/var/postgres -s'
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
