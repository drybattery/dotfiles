PS1="\[\033[36m\]\[\033[4m\]\W\[\033[0m\033[36m\]\n[\[\033[37m\]\t\[\033[39m\033[36m\]]\$\[\033[39m\] "

## alias for commands
alias vi='nvim'
alias vin='nvim --noplugin'
alias vide='nvim -S ~/.config/nvim/ide.vim'
alias cd='cdls'
alias ls='ls -G'
alias mv='mv -i'
# alias rm='rm -i'
alias od='od -x'
alias ll='ls -lh'
alias rsync='rsync -auvrz'
alias kill='kill -9'
alias trans='trans -brief'
alias trans_ja='trans -brief -from=ja -to=en'
alias trans_en='trans -brief -from=en -to=ja'

# alias for edit by vim
alias vimrc='nvim ~/.config/nvim/init.vim ~/.config/nvim/vimrc/*.vim'
alias bashrc='nvim --noplugin ~/.bashrc;source ~/.bashrc'
alias bash_profile='nvim --noplugin ~/.bash_profile;source ~/.bash_profile'

## alias for mac
# alias mdfind='mdfind -onlyin'
# alias updatedb='sudo /usr/libexec/locate.updatedb'
# alias rdc='open /Users/suzukisohei/Documents/RDC\ Connections/Default.rdp'
# alias ql='qlmanage -p "$@" >& /dev/null'
# alias youtube='vi $GKT/youtube/video.js -c cd" "$GKT/youtube;open /Applications/GeekTool.app'
# alias cpwd='pwd;pwd|pbcopy'

## binds
bind '"\C-h":"ranger-cd\C-m"'

## functions
function ggl(){
    g++ -Wall -O2 -framework GLUT -framework OpenGL $@
}
function cdls(){
    \cd $@ && ls
}
function pyplotio(){
    export MPLBACKEND="module://itermplot"
    pyplot $@
    unset MPLBACKEND
}
function pyhistio(){
    export MPLBACKEND="module://itermplot"
    pyhist $@
    unset MPLBACKEND
}
function ranger-cd(){
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    echo -en "\033[1A\033[2K"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
function google() { # Goolge Search by Google Chrome
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
            str="$str${str:++}$i"
        done
        opt='search?num=100'
        opt="${opt}&q=${str}"
    fi
    open -a Google\ Chrome http://www.google.co.jp/$opt
}
function command_not_found_handle(){
    echo -e "  __        ___    ____ _____ _____ ____   \n"\
            " \\ \\      / / \\  / ___|_   _| ____|  _ \\  \n"\
            "  \\ \\ /\\ / / _ \\ \\___ \\ | | |  _| | | | | \n"\
            "   \\ V  V / ___ \\ ___) || | | |___| |_| | \n"\
            "    \\_/\_/_/   \\_\\____/ |_| |_____|____/  \n"
}

