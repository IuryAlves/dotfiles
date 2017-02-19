# import git functions

source ~/.git_functions.sh
eval $(thefuck --alias)
export color_prompt=yes

f_vd() {
   cd ~/dev/vivadecora-v2
   . dev.sh
   source ~/dev/venvs/vd34/bin/activate
   ci/decrypt-env-vault.sh
   source environment-variable.decrypt
   nvm use v5.8.0
}
alias vd=f_vd
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

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;35m\]\w \[\033[01;32m\]$(__git_branch) \[\033[31m\]$(__git_arrows) \[\033[00m\]\n\$ '
else
    PS1='\w ($(__git_branch) $(__git_arrows))\n\$ '
fi
unset color_prompt

alias qfeaturebranch=f_qfeaturebranch
alias birl=brew
alias .=source
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
export WORKON_HOME=~/dev/venvs/
source /usr/local/bin/virtualenvwrapper.sh
