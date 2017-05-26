export PATH=${PATH}:~/bin
export PATH=${PATH}:/usr/local/share/sage
export PATH=${PATH}:/Library/Frameworks/PROJ.framework/Programs
export EDITOR='/usr/bin/emacs -q'

alias ls='ls -GF'
alias ll='ls -lGFh'
alias less='less -eX'
alias hh='history 20'

# Application aliases
alias emacs='emacs -q'
#alias e='open -a /Users/richardsc/applications/Emacs'
alias e='open -a Emacs'
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n'
alias nb='~/src/nb/nb'
alias nn='nota'
alias n='PYTHONPATH=~/src/nota python -m nota'
alias nt='PYTHONPATH=~/src/nota python -m nota --database ~/Dropbox/nota-test.db'
alias skim='open -a Skim.app'
alias acroread='open -a Adobe\ Acrobat\ Reader\ DC.app'
alias dirs='dirs -v'
alias ae='aquamacs'
alias aenw='/Applications/Aquamacs.app/Contents/MacOS/Aquamacs -nw'
alias mt='mterm -x /usr/bin/matlab -nodesktop -nosplash'
alias ml='/usr/bin/matlab -nodesktop -nosplash'
alias r='open -a R.app'
#alias rt='xterm -bg LightSlateGray -fg snow -T R -e /usr/bin/R &'
alias rt='rterm -x /usr/bin/R'
alias td='python ~/bin/t.py --task-dir ~/Dropbox --list todo'
alias t='python ~/bin/t.py --task-dir . --list tasks'
alias inkscape='/Applications/Inkscape.app/Contents/Resources/bin/inkscape'
alias readme='displayreadme'
alias netmon='lsof -P -i -n | cut -f 1 -d " " | uniq'
alias boce='g oce; git pl; cd ..; make oce'
alias octave='/usr/local/octave/3.8.0/bin/octave'

# Hibernate mode; doesn't seem to work in 10.8
alias hibernateon="sudo pmset -a hibernatemode 1"
alias hibernateoff="sudo pmset -a hibernatemode 0"

# Setting PATH for MacPython 2.6
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
# export PATH

# Setting PATH for EPD_Py25 v4.2.30201
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
# export PATH

# Set path for Git after Snow-leopard upgrade
export PATH=${PATH}:/usr/local/git/bin
##
# Your previous /Users/richardsc/.profile file was backed up as /Users/richardsc/.profile.macports-saved_2010-02-02_at_14:29:55
##

# Show git branch and status at bash prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Setting PATH for EPD-7.0-1
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
# export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# Add task count (for tasks in current directory)
function count_tasks {
    ~/bin/t.py | wc -l | sed -e 's/ *//' 2> /dev/null | sed -e 's/^0$//' | sed -e 's/^/(/' | sed -e 's/$/t)/' | sed -e 's/(t)//'
}
function count_todo {
    cat ~/Dropbox/todo | wc -l | sed -e 's/ *//' 2> /dev/null | sed -e 's/^0$//' | sed -e 's/^/|/' | sed -e 's/$/td|/' | sed -e 's/|td|//'
}

# function to detect if a README* file is present in current directory
function detect_readme {
    test=`ls | grep README | wc -l`
    if [ $test -gt 0 ]; then
	echo "[RM]"
    fi
}

function last_two_dirs {                                                        
pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_                          
} 

## export PS1='\h:\[\033[1;33m\]\W\[\033[0m\]'
export PS1='\h:\[\033[1;33m\]$(last_two_dirs)/\[\033[0m\]'
export PS1="$PS1\$(parse_git_branch)"
export PS1="$PS1\$(count_tasks)"
export PS1="\[\033[0;31m\]\$(count_todo)\[\033[0m\]$PS1"
export PS1="\[\033[0;32m\]\$(detect_readme)\[\033[0m\]$PS1"
export PS1="$PS1$ "

#Bashmarks
source ~/bin/bashmarks.sh

# added by Anaconda2 2.5.0 installer
export PATH="/Users/richardsc/anaconda/bin:$PATH"