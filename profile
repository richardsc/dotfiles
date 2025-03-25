export PATH=${PATH}:~/bin
export PATH=${PATH}:/usr/local/share/sage
export PATH=${PATH}:/Library/Frameworks/PROJ.framework/Programs
export EDITOR='/usr/bin/vi'
if [ $(uname -m) == 'arm64' ]; then
    export PATH=$PATH:/opt/R/arm64/gfortran/bin
fi
export MPI_HOME=/opt/homebrew/Cellar/open-mpi/4.1.4_2
# export NETCDF_ROOT=/opt/homebrew/Cellar/netcdf/4.8.1
export PATH=~/.local/bin:$PATH

alias ls='ls -GF'
alias ll='ls -lGFh'
alias less='less -eX'
alias hh='history 20'

# Application aliases
alias tig='tig --word-diff'
alias emacs='emacs -q'
alias e='open -a Emacs'
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n'
# alias nb='~/src/nb/nb'
# alias nn='nota'
# alias n='PYTHONPATH=~/src/nota python -m nota'
# alias nt='PYTHONPATH=~/src/nota python -m nota --database ~/Dropbox/nota-test.db'
alias skim='open -a Skim.app'
alias acroread='open -a Adobe\ Acrobat\ Reader.app'
alias dirs='dirs -v'
# alias ae='aquamacs'
# alias aenw='/Applications/Aquamacs.app/Contents/MacOS/Aquamacs -nw'
alias r='open -a R.app'
# alias td='python ~/bin/t.py --task-dir ~/Dropbox --list todo'
# alias t='python ~/bin/t.py --task-dir . --list tasks'
alias inkscape='/Applications/Inkscape.app/Contents/Resources/bin/inkscape'
alias readme='displayreadme'
alias netmon='lsof -P -i -n | cut -f 1 -d " " | uniq'

# Show git branch and status at bash prompt
function parse_git_dirty {
    [[ $(git status 2>/dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# MKL_NUM_THREADS=1
# export MKL_NUM_THREADS

# # Add task count (for tasks in current directory)
# function count_tasks {
#     ~/bin/t.py | wc -l | sed -e 's/ *//' 2> /dev/null | sed -e 's/^0$//' | sed -e 's/^/(/' | sed -e 's/$/t)/' | sed -e 's/(t)//'
# }
# function count_todo {
#     cat ~/Dropbox/todo | wc -l | sed -e 's/ *//' 2> /dev/null | sed -e 's/^0$//' | sed -e 's/^/|/' | sed -e 's/$/td|/' | sed -e 's/|td|//'
# }

# function to detect if a README* file is present in current directory
function detect_readme {
    test=$(ls | grep README | wc -l)
    if [ $test -gt 0 ]; then
        echo "[RM]"
    fi
}

function last_two_dirs {
    pwd | rev | awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}

## export PS1='\h:\[\033[1;33m\]\W\[\033[0m\]'
export PS1='\h:\[\033[1;33m\]$(last_two_dirs)/\[\033[0m\]'
export PS1="$PS1\$(parse_git_branch)"
# export PS1="$PS1\$(count_tasks)"
# export PS1="\[\033[0;31m\]\$(count_todo)\[\033[0m\]$PS1"
export PS1="\[\033[0;32m\]\$(detect_readme)\[\033[0m\]$PS1"
export PS1="$PS1$ "

export LSCOLORS=Gxfxcxdxbxegedabagacad

#Bashmarks
source ~/bin/bashmarks.sh

# Z
if [ $(uname -m) == 'arm64' ]; then
    source /opt/homebrew/etc/profile.d/z.sh
    . "$HOME/.cargo/env"
else
    source /usr/local/etc/profile.d/z.sh
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/richardsc/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/richardsc/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/richardsc/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/richardsc/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/Users/richardsc/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/richardsc/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
