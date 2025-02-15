## completion
compctl -g "*.go" gofmt # standard go tools
compctl -g "*.go" gccgo # gccgo

# gc
for p in 5 6 8; do
  compctl -g "*.${p}" ${p}l
  compctl -g "*.go" ${p}g
done
unset p

## aliases
alias gob='go build'
alias goc='go clean'
alias god='go doc'
<<<<<<< HEAD
alias goe='go env'
=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
alias gof='go fmt'
alias gofa='go fmt ./...'
alias gofx='go fix'
alias gog='go get'
alias goga='go get ./...'
alias goi='go install'
alias gol='go list'
alias gom='go mod'
alias gopa='cd $GOPATH'
alias gopb='cd $GOPATH/bin'
alias gops='cd $GOPATH/src'
alias gor='go run'
alias got='go test'
alias gota='go test ./...'
alias goto='go tool'
alias gotoc='go tool compile'
alias gotod='go tool dist'
alias gotofx='go tool fix'
alias gov='go vet'
<<<<<<< HEAD
alias gove='go version'
alias gow='go work'
=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
