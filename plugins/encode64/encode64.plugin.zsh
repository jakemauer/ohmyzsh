encode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64
    else
        printf '%s' $1 | base64
    fi
}

<<<<<<< HEAD
encodefile64() {
    if [[ $# -eq 0 ]]; then
        echo "You must provide a filename"
    else
        base64 -i $1 -o $1.txt
        echo "${1}'s content encoded in base64 and saved as ${1}.txt"
    fi
}

=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
decode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64 --decode
    else
        printf '%s' $1 | base64 --decode
    fi
}
alias e64=encode64
<<<<<<< HEAD
alias ef64=encodefile64
=======
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
alias d64=decode64
