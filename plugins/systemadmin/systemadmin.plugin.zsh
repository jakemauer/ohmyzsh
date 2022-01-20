# ------------------------------------------------------------------------------
# Description
# -----------
#
# This is one for the system administrator, operation and maintenance.
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
# * Dongweiming <ciici123@gmail.com>
#
# ------------------------------------------------------------------------------

function retlog() {
    if [[ -z $1 ]];then
        echo '/var/log/nginx/access.log'
    else
        echo $1
    fi
}

alias ping='ping -c 5'
alias clr='clear; echo Currently logged in on $TTY, as $USERNAME in directory $PWD.'
alias path='print -l $path'
alias mkdir='mkdir -pv'
# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1 -nr'
alias psmem10='ps -e -orss=,args= | sort -b -k1 -nr | head -n 10'
# get top process eating cpu if not work try execute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr | head -n 10'
# top10 of the history
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

<<<<<<< HEAD
function ip() {
    if [ -t 1 ]; then
        command ip -color "$@"
    else
        command ip "$@"
    fi
}

# directory LS
function dls() {
    print -l *(/)
}
function psgrep() {
    ps aux | grep "${1:-.}" | grep -v grep
}
# Kills any process that matches a regexp passed to it
function killit() {
=======
# directory LS
dls () {
    print -l *(/)
}
psgrep() {
    ps aux | grep "${1:-.}" | grep -v grep
}
# Kills any process that matches a regexp passed to it
killit() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# list contents of directories in a tree-like format
if ! (( $+commands[tree] )); then
<<<<<<< HEAD
    function tree() {
=======
    tree () {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
        find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
    }
fi

# Sort connection state
<<<<<<< HEAD
function sortcons() {
=======
sortcons() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -nat |awk '{print $6}'|sort|uniq -c|sort -rn
}

# View all 80 Port Connections
<<<<<<< HEAD
function con80() {
=======
con80() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -nat|grep -i ":80"|wc -l
}

# On the connected IP sorted by the number of connections
<<<<<<< HEAD
function sortconip() {
=======
sortconip() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
}

# top20 of Find the number of requests on 80 port
<<<<<<< HEAD
function req20() {
=======
req20() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -anlp|grep 80|grep tcp|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -nr|head -n20
}

# top20 of Using tcpdump port 80 access to view
<<<<<<< HEAD
function http20() {
=======
http20() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    sudo tcpdump -i eth0 -tnn dst port 80 -c 1000 | awk -F"." '{print $1"."$2"."$3"."$4}' | sort | uniq -c | sort -nr |head -n 20
}

# top20 of Find time_wait connection
<<<<<<< HEAD
function timewait20() {
=======
timewait20() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -n|grep TIME_WAIT|awk '{print $5}'|sort|uniq -c|sort -rn|head -n20
}

# top20 of Find SYN connection
<<<<<<< HEAD
function syn20() {
=======
syn20() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -an | grep SYN | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr|head -n20
}

# Printing process according to the port number
<<<<<<< HEAD
function port_pro() {
=======
port_pro() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    netstat -ntlp | grep "${1:-.}" | awk '{print $7}' | cut -d/ -f1
}

# top10 of gain access to the ip address
<<<<<<< HEAD
function accessip10() {
=======
accessip10() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk '{counts[$(11)]+=1}; END {for(url in counts) print counts[url], url}' "$(retlog)"
}

# top20 of Most Visited file or page
<<<<<<< HEAD
function visitpage20() {
=======
visitpage20() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk '{print $11}' "$(retlog)"|sort|uniq -c|sort -nr|head -n 20
}

# top100 of Page lists the most time-consuming (more than 60 seconds) as well as the corresponding page number of occurrences
<<<<<<< HEAD
function consume100() {
=======
consume100() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk '($NF > 60 && $7~/\.php/){print $7}' "$(retlog)" |sort -n|uniq -c|sort -nr|head -n 100
    # if django website or other website make by no suffix language
    # awk '{print $7}' "$(retlog)" |sort -n|uniq -c|sort -nr|head -n 100
}

# Website traffic statistics (G)
<<<<<<< HEAD
function webtraffic() {
=======
webtraffic() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk "{sum+=$10} END {print sum/1024/1024/1024}" "$(retlog)"
}

# Statistical connections 404
<<<<<<< HEAD
function c404() {
=======
c404() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk '($9 ~/404/)' "$(retlog)" | awk '{print $9,$7}' | sort
}

# Statistical http status.
<<<<<<< HEAD
function httpstatus() {
=======
httpstatus() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk '{counts[$(9)]+=1}; END {for(code in counts) print code, counts[code]}' "$(retlog)"
}

# Delete 0 byte file
<<<<<<< HEAD
function d0() {
=======
d0() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    find "${1:-.}" -type f -size 0 -exec rm -rf {} \;
}

# gather external ip address
<<<<<<< HEAD
function geteip() {
    curl -s -S -4 https://icanhazip.com

    # handle case when there is no IPv6 external IP, which shows error
    # curl: (7) Couldn't connect to server
    curl -s -S -6 https://icanhazip.com 2>/dev/null
    local ret=$?
    (( ret == 7 )) && print -P -u2 "%F{red}error: no IPv6 route to host%f"
    return $ret
}

# determine local IP address(es)
function getip() {
=======
geteip() {
    curl -s -S -4 https://icanhazip.com
    curl -s -S -6 https://icanhazip.com
}

# determine local IP address(es)
getip() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    if (( ${+commands[ip]} )); then
        ip addr | awk '/inet /{print $2}' | command grep -v 127.0.0.1
    else
        ifconfig | awk '/inet /{print $2}' | command grep -v 127.0.0.1
    fi
}

# Clear zombie processes
<<<<<<< HEAD
function clrz() {
=======
clrz() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    ps -eal | awk '{ if ($2 == "Z") {print $4}}' | kill -9
}

# Second concurrent
<<<<<<< HEAD
function conssec() {
=======
conssec() {
>>>>>>> 16344a98 (Merge branch 'ohmyzsh:master' into master)
    awk '{if($9~/200|30|404/)COUNT[$4]++}END{for( a in COUNT) print a,COUNT[a]}' "$(retlog)"|sort -k 2 -nr|head -n10
}
