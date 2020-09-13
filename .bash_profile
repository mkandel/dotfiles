alias ls='ls -F'
alias l='ls -aF'
alias ll='ls -alFh'
#alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
alias gv='/Applications/MacVim.app/Contents/MacOS/Vim --remote-tab-silent '
alias bye='exit'
alias cls='clear'
alias h='history'

# have more (really less) behave like I'm used to more behaving, just exit at EOF instead of requiring typing 'q'
alias more='more -e'

alias src='cd ~/src/'

# rails
alias rs='rails server'
alias rr='rails routes'
alias bi='bundle install'

export SVN_EDITOR=vi
export HISTIGNORE="&:exit"
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=100000
export GOPATH=~/src/go/playing_with_go
export GO111MODULE=on # needed to use 1.11+ modules within $GOPATH
#export PATH=/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/mysql/bin:$GOPATH/bin:$PATH

export RUBYLIB=/usr/local/opt/ruby/lib/
export GEM_PATH=/usr/local/opt/ruby/lib/ruby/gems/2.6.0/
export GEM_HOME=/usr/local/opt/ruby/lib/ruby/gems/
# Custom path
#export PATH=$GEM_HOME/bin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/mysql/bin:$GOPATH/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# Make sure MAcVim is the first vim in the path
export PATH="/Applications/MacVim.app/Contents/bin/:$PATH"

## alias to use go-swagger Docker container
alias swagger="docker run --rm -it -e GOPATH=$GOPATH:$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger" # swagger version

## Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

_gitcommands()
{
    COMPREPLY=( $( compgen -o plusdirs -W '$( command cat /Users/marc/.gitcommands )' -- ${COMP_WORDS[COMP_CWORD]} ));
}

complete -o filenames -F _gitcommands git

## Perl helpers:
alias pmp='perldoc -l'

pmv () 
{ 
    perl -M$1 -le "print $1->VERSION"
}

is_pushd(){
    dirs | awk '{print $2}' | sed -e '/^$/d' -e 's/\(.*\)/ [*DIR_STACK*]/'
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("git:${ref#refs/heads/}")"
}

#export PS1='[\u@\h \w]$(parse_git_branch)$(is_pushd)\n \$ ‘
export PS1='[\u@\h \w] $(parse_git_branch)\n $ '


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
#export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

export PATH="$HOME/.cargo/bin:$PATH"
