if [ -f ~/.profile ]; then
    . ~/.profile
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/richardsc/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

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
