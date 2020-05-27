if [ -f ~/.sensible.bash ]; then
   source ~/.sensible.bash
fi

# aliases
alias ls='ls -G'
alias ll='ls -l'

# bash-completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# direnv hook
eval "$(direnv hook bash)"
