function jgrep()
{
    find `pwd` -name .repo -prune -o -name .git -prune -o  -type f -name "*\.java" -print0 | xargs -0 grep --color -n "$@"
}

function cgrep()
{
    find `pwd` -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' \) -print0 | xargs -0 grep --color -n "$@"
}

function jsgrep() {
    find `pwd` -name .repo -prune -o -name .git -prune -o  -type f -name "*\.js" -print0 | xargs -0 grep --color -n "$@"
}

function resgrep()
{
    for dir in `find . -name .repo -prune -o -name .git -prune -o -name res -type d`; do find $dir -type f -name '*\.xml' -print0 | xargs -0 grep --color -n "$@"; done;
}

function addRoute() {
  SERVER=$1
  IP=`host $1 | awk '{print $4}' | head -n1`
  echo adding $IP to static route table
  ip route add $IP dev tun0
}

function xsh()
{
    if [ -z "$1" ]; then
        echo "usage:xssh alibuild2"
        return
    fi

    #MY_TERM_NAME=`ps -p $(ps -p $$ -o ppid=) -o args=`
    MY_TERM_NAME="`ps -p $(ps -p $$ -o ppid=) -o args= | sed 's:\/:_:g' | sed 's:\s:_:g'`"
    CMD="bash -c -l \"export TERM_NAME=$MY_TERM_NAME;cd ~/develop/adas/;bash --login\""
    ssh $1 -t $CMD
}

function envsetup()
{
    export https_proxy=http://b00405860:Yang%401812@proxyhk.huawei.com:8080
    export http_proxy=http://b00405860:Yang%401812@proxyhk.huawei.com:8080
    export HTTPS_PROXY=http://b00405860:Yang%401812@proxyhk.huawei.com:8080
    export HTTP_PROXY=http://b00405860:Yang%401812@proxyhk.huawei.com:8080
    export NO_PROXY=.huawei.com,10.160.*,*.huawei.com
}

function envclean()
{
    unset  https_proxy
    unset  http_proxy
    unset  HTTPS_PROXY
    unset  HTTP_PROXY
    unset  NO_PROXY
}

function upload()
{
  ncftpput -R -u b00405860 -p Yang@1812 -P 8002 10.143.133.8 / "$1"
}

function download()
{
  ncftpget -R -T -u b00405860 -p Yang@1812 -P 8002 10.143.133.8 ./ "$1"
}

function ls_ftp()
{
  ncftp ftp://b00405860:Yang%401812@10.143.133.8:8002/<<EOF
      ls -l "$1"
EOF
}

