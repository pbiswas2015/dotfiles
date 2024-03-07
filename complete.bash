# case insensitive completion
bind 'set completion-ignore-case on'
#bind 'set menu-complete-ignore-case on'

# stop and show at ambigous character
bind 'set show-all-if-ambiguous on'

# shows all possible completions without hitting Tab twice if current word remains unchanged
bind 'set show-all-if-unmodified on'

# append a slash to directory names when completing
bind 'set mark-directories on'
bind 'set mark-symlinked-directories on'

# displays common prefix of possible completions when cycling through them
bind 'set menu-complete-display-prefix on'

# allows you to cycle through completions in reverse order by pressing Shift+Tab
#bind 'set menu-complete-backward on'

# colorizes the output of file completion based on file type
bind 'set colored-stats on'

# displays the common prefix of the set of possible completions using a different color
bind 'set colored-completion-prefix on'

# set the style of the bell when completion is not possible
bind 'set bell-style none'

###############################################################################

[[ -f ~/.local/share/bash-completion/lsd.bash ]]               && source ~/.local/share/bash-completion/lsd.bash
[[ -f ~/.local/share/bash-completion/fd.bash ]]                && source ~/.local/share/bash-completion/fd.bash
[[ -f ~/.local/share/bash-completion/sd.bash ]]                && source ~/.local/share/bash-completion/sd.bash
[[ -f ~/.local/share/bash-completion/dust.bash ]]              && source ~/.local/share/bash-completion/dust.bash
[[ -f ~/.local/share/bash-completion/rg.bash ]]                && source ~/.local/share/bash-completion/rg.bash
[[ -f ~/.local/share/bash-completion/bat.bash ]]               && source ~/.local/share/bash-completion/bat.bash
[[ -f ~/.local/share/bash-completion/cht.sh.bash ]]            && source ~/.local/share/bash-completion/cht.sh.bash
[[ -f ~/.local/share/bash-completion/tmuxinator.bash ]]        && source ~/.local/share/bash-completion/tmuxinator.bash
[[ -f ~/.local/share/bash-completion/cheat.bash ]]             && source ~/.local/share/bash-completion/cheat.bash
[[ -f ~/.local/share/bash-completion/git-forgit.bash ]]        && source ~/.local/share/bash-completion/git-forgit.bash
[[ -f ~/.local/share/bash-completion/parallel.bash ]]          && source ~/.local/share/bash-completion/parallel.bash
[[ -f ~/.local/share/bash-completion/watchexec.bash ]]         && source ~/.local/share/bash-completion/watchexec.bash
[[ -f ~/.local/share/bash-completion/dotter.bash ]]            && source ~/.local/share/bash-completion/dotter.bash
[[ -f ~/.local/share/bash-completion/just.bash ]]              && source ~/.local/share/bash-completion/just.bash
[[ -f ~/.local/share/bash-completion/tealdeer.bash ]]          && source ~/.local/share/bash-completion/tealdeer.bash
[[ -f ~/.local/share/bash-completion/rnr.bash ]]               && source ~/.local/share/bash-completion/rnr.bash
[[ -f ~/.local/share/bash-completion/pastel.bash ]]            && source ~/.local/share/bash-completion/pastel.bash
[[ -f ~/.local/share/bash-completion/ouch.bash ]]              && source ~/.local/share/bash-completion/ouch.bash
[[ -f ~/.local/share/bash-completion/hyperfine.bash ]]         && source ~/.local/share/bash-completion/hyperfine.bash
[[ -f ~/.local/share/bash-completion/xh.bash ]]                && source ~/.local/share/bash-completion/xh.bash
[[ -f ~/.local/share/bash-completion/httpie-completion.bash ]] && source ~/.local/share/bash-completion/httpie-completion.bash
[[ -f ~/.local/share/bash-completion/procs.bash ]]             && source ~/.local/share/bash-completion/procs.bash
[[ -f ~/.local/share/bash-completion/yq.bash ]]                && source ~/.local/share/bash-completion/yq.bash
[[ -f ~/.local/share/bash-completion/yqi_completion.bash ]]    && source ~/.local/share/bash-completion/yqi_completion.bash

register_python_argcomplete_path=`which register-python-argcomplete 2> /dev/null`
if [[ -f $register_python_argcomplete_path ]]; then
  # pip
  eval "$(register-python-argcomplete pip)"
  # pipx
  eval "$(register-python-argcomplete pipx)"
fi

###############################################################################

# complete alias
[[ -f ~/apps/complete-alias/complete_alias ]] && source ~/apps/complete-alias/complete_alias

complete -F _complete_alias o
complete -F _complete_alias p
complete -F _complete_alias t
complete -F _complete_alias cp
complete -F _complete_alias sk
