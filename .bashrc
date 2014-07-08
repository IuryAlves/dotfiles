# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
function gitbranch {     if git branch > /dev/null 2>&1; then         echo -e "$(git branch 2> /dev/null | grep '^*' | sed 's/^* //') ";     fi; }


PS1='\[\033[01;32m\]$(gitbranch)\[\033[01;35m\]\w\[\033[00m\]\n\$ '
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/iury/qmagico/google_appengine"
export GAE_SDK="/home/iury/qmagico/google_appengine"

alias qmagico="cd /home/iury/qmagico/aulasdovaca/"
alias runserver="/home/iury/qmagico/aulasdovaca/ci/css.sh; dev_appserver.py --show_mail_body --datastore_path=dev.appstore src --blobstore_path=~/blob"
alias projetos="cd /home/iury/projetos/"
alias sublime="/home/iury/Downloads/Sublime/sublime_text"
alias node="/usr/bin/nodejs"
export PATH=$HOME/local/bin:$PATH
alias qcurrbranch='git rev-parse --abbrev-ref HEAD'
alias qsetup='git branch dev --set-upstream-to origin/dev \
              && git branch master --set-upstream-to origin/master \
              && git config branch.autosetuprebase always \
              && git config branch.master.rebase true \
              && git config branch.dev.rebase true \
              && git config branch.$(qcurrbranch).rebase true'
alias qpull='qsetup && git pull --rebase origin $(qcurrbranch)'
alias qpush='qsetup && git push origin $(qcurrbranch) && echo nao se esqueca de fazer merge em dev =)'
f_qmerge() {
    if [ $1 ]
    then
        thatbranch=$1
        thisbranch=$(qcurrbranch)
        git merge --no-ff -m "Fazendo merge da $thatbranch em $thisbranch [$2]" $thatbranch
    else
        echo 'Faz merge de outra branch na branch atual'
        echo '-----------------------------------------'
        echo 'Usage: qmerge <other_branch> [commit_msg]'
    fi
}
alias qmerge=f_qmerge
f_qfeaturebranch() {
    if [ $1 ]
    then
        newbranch=$1
        git checkout -b $newbranch
        qsetup
    else
        echo 'Cria uma feature branch a partir da branch atual'
        echo '-----------------------------------------'
        echo 'Usage: qfeaturebranch <new_branch>'
    fi
}
alias qfeaturebranch=f_qfeaturebranch
alias qcurrbranch='git rev-parse --abbrev-ref HEAD'
f_qsetup() {
    git branch master --quiet --set-upstream-to origin/master
    git config branch.autosetuprebase always
    git config branch.master.rebase true
    git config branch.$(qcurrbranch).rebase true
}
alias qsetup=f_qsetup
alias qpull='qsetup && git pull --rebase origin $(qcurrbranch)'
alias qpush='qsetup && git push origin $(qcurrbranch)'
f_qmerge() {
    if [ $1 ]
    then
        thatbranch=$1
        thisbranch=$(qcurrbranch)
        git merge --no-ff -m "Fazendo merge da $thatbranch em $thisbranch [$2]" $thatbranch
    else
        echo 'Faz merge de outra branch na branch atual'
        echo '-----------------------------------------'
        echo 'Usage: qmerge <other_branch> [commit_msg]'
    fi
}
alias qmerge=f_qmerge
f_qfeaturebranch() {
    if [ $1 ]
    then
        newbranch=$1
        git checkout -b $newbranch
        qsetup
    else
        echo 'Cria uma feature branch a partir da branch atual'
        echo '-----------------------------------------'
        echo 'Usage: qfeaturebranch <new_branch>'
    fi
}
alias qfeaturebranch=f_qfeaturebranch
alias qdiario="git log --author=<iury> --no-merges --since=yesterday --pretty=\"format: %s \" | tac"

alias karma="/usr/lib/node_modules/karma/bin/karma"
alias estante-comp="cd /home/iury/qmagico/estante-components/"
alias estante="cd /home/iury/qmagico/estantemagica/"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
