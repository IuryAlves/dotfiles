export WORKON_HOME=~/Envs
source $(which virtualenvwrapper.sh)

if [ ! -d "$WORKON_HOME/vd34" ]; then
    mkvirtualenv vd34 --python=$(which python3)
fi

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export USER=iury
 #Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
export DEFAULT_USERNAME="iury"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/yori/.local/bin:/home/yori/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function mkgit() {
	dir=$1
	mkdir $dir
	cd $dir
	git init
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PYTHONPATH="$PYTHONPATH:$GOOGLE:$WEBAPP2"
export VAULT_PASS=$(cat ~/.vivadecora/password-vault)

f_vd() {
   cd ~/dev/plataforma
   source dev.sh
   source $WORKON_HOME/vd34/bin/activate
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
alias qfeaturebranch=f_qfeaturebranch
alias birl=brew
alias .=source
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
