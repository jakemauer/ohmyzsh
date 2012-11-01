# Project Shortcuts
# -----------------
alias jb="cd ~/Dropbox/AppDirect/Sites/jBilling"
alias jbui="cd ~/Dropbox/AppDirect/Sites/jBilling\ UI"
alias ad="cd ~/Dropbox/AppDirect/Sites/AppDirect"
alias adi="cd ~/Dropbox/AppDirect/Sites/AppDirect/site/adi"

# SSH & Tunnels
# -------
alias ssh-jbd="ssh appdirect@dev.jbilling.com"
alias ssh-jbp="ssh appdirect@www.jbilling.com"
alias ssh-add="ssh appdirect@staging.appdirect.com"
alias ssh-adp="ssh appdirect@info.appdirect.com"

# DB Stuff
# --------
# PG
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgtail='tail -f /usr/local/var/postgres/server.log'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# MySQL
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
# Both
alias startdbs='pgstart;mysqlstart' # now both at once!
alias stopdbs='pgstop;mysqlstop' # now both at once!
alias restartdbs='stopdbs;startdbs' # now both at once!

# System Level
# ------------
alias goodbye='sudo shutdown -r now'
alias uldb='sudo /usr/libexec/locate.updatedb' #update the location database
alias rvm_install_shortcut='bash -s head < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)'
alias flush_dns='dscacheutil -flushcache'
alias fixbrew='sudo chown -R `whoami` /usr/local'
alias c='clear'
alias rm_sym='find . ! -name . -prune -type l|xargs rm'

# Directories
alias l='ls -lah'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias desktop_white="open /Users/macpro/Dropbox/Pictures/Desktop\ Backgrounds/White\ Desktop\ Background.app"


# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"


# RUBY / RAILS
# ------------
# you need to use bundle exec before each command you run in a app controled by bundler so this alias helps make that easier
alias b='bundle exec $*'
alias p='bundle exec powder $*'
alias pc='bundle exec pickler $*'
alias rdm='bundle exec rake db:migrate $*'
#alias migrate="bundle exec rake db:migrate && bundle exec rake db:test:prepare"

# Git
# -----------------
alias gg='git goggles'
# alias ggc='git goggles codereview'
alias ggc='git log -p --reverse master..'
alias ggcc='git goggles codereview complete'
alias -g bd='git diff --name-status'
alias glg='git log --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias glgl='git log --no-merges --reverse --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias gt='git tag'
alias gt_remote='git ls-remote --tags'
alias gt_delete='git push origin :refs/tags/'
alias gwc='git whatchanged'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias gmt='git mergetool'
alias co_remote='ruby /rails/github/gg_utility/git_goggles_ruby_checkout.rb'
alias prune_merged='ruby /rails/github/gg_utility/git_goggles_prune_merged.rb'

# Nocorrect Aliases
# -----------------
alias grb='nocorrect grb'
alias rdm='nocorrect rvm'

# Apps
# ----
alias vim='mvim -v'
alias tl='tmux ls'
alias ta='tmux attach -t $*'
alias tk='tmux kill-session -t $*'
alias to='tmuxinator open $*'
alias ts='tmuxinator start $*'
alias ml='tmuxinator list'
alias cs='echo -n -e "\e[3J" && clear && exec zsh'

# RAILS
# -----
alias rc='bundle exec rails console $*'
alias rcdb='bundle exec rails dbconsole $*'
