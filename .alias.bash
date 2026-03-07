
alias n='nvim -p'
alias ndiff='nvim -d'

alias v='vim'
alias vv='view'

alias g='gvim -p'
alias gv='gview -p'
alias gb='gvim -p -u ~/.vimrc.barebone'
alias gvb='gview -p -u ~/.vimrc.barebone'
alias gn='gvim -p -u none'
alias gvn='gview -p -u none'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


alias ls='ls --color=auto'
alias lt='ls -ltra'
alias la='ls -ltra'
alias l1='ls -1rt'
alias lg='ls -lrta | grep -i'

# eza
eza_path=`which eza 2> /dev/null`
if [[ -f $eza_path ]]; then
  alias ll="eza -l -a -g --icons --git -s time"
  alias llt="eza -l -a --icons --tree --git-ignore"
  alias llr="eza -l -a -g --recurse --icons --git"
  alias l1="eza -1 -a --icons --git"
  alias lg='ll | rg -i'
  alias cl='clear;eza'
fi

alias c='clear'
alias cl='clear;ls'

alias pf='readlink -f'
alias rp='readlink -f'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'

alias .='pwd'
alias p="pwd"
alias h='history'
alias h25='history 25'
alias tk='tkdiff'

# dust
alias du1='dust -r --threads 2 -d 1'
alias du2='dust -r --threads 2 -d 2'
alias du1r='dust --threads 2 -d 1'
alias du2r='dust --threads 2 -d 2'

# git
alias gco='git checkout'
alias gcl='git clone'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

# tools
alias t='tere'
alias pi='pipr'
alias o='ouch'
alias cp='xcp -r'
alias pc='pipecolor -c ~/.config/pipecolor/config.toml'
alias yless='jless --yaml'
alias ungron='gron --ungron'

#############################################################
# functions
# hs - history search
unalias hs 2> /dev/null
function hs() {
    if [ $# == 0 ]; then
        # do nothing
        echo "Usage: hs <search_string_in_history>"
    else
        history | rg ${1}
    fi 
}

#############################################################
# pf - get file realpath with fzf
unalias pf 2> /dev/null
function pf() {
    # No arguments
    if [ $# == 0 ]; then
        hostname=`hostname`
	      if [ -z $TMUX  ]; then
            fzf_cmd="fzf"
        else
            fzf_cmd="fzf-tmux"
        fi
        fval=$(fd -E .snapshot/ -H | $fzf_cmd)
        ret_status=$?
        if [ $ret_status != 0 ]; then
            return
        fi
        abs_path=`readlink -f $fval`
    else 
        abs_path=`readlink -f ${1}`
    fi
    echo " ${abs_path}"
}

#############################################################
# pg - search for process by name
unalias pg 2> /dev/null
function pg() {
    ps -aux | grep -v " grep " | grep -P -i "^USER|${1}"
}
export -f pg > /dev/null

#############################################################
# fn - get fd like behavious with find
unalias fn 2> /dev/null
function fn() {
    if [[ $2 != '' ]]; then
        find $2 | grep -P -i $1
    else
        find ./ | grep -P -i $1
    fi
}
export -f fn > /dev/null

#############################################################
# mkcd - create and cd to directory
function mkcd () {
    mkdir -p $1
    cd $1
    echo " $(pwd)"
}

#############################################################
# cdf - fuzzy cd into directory
unalias cdf 2> /dev/null
function cdf() {
    cur_dir=`pwd`
    hostname=`hostname`
    fzf_cmd="fzf-tmux"
    if [[ $1 != '' ]]; then
        fval=$(fd -E .snapshot/ -t d -H -d $1| $fzf_cmd)
    else
        fval=$(fd -E .snapshot/ -t d -H | $fzf_cmd)
    fi
    ret_status=$?
    if [ $ret_status == 0 ]; then
        cd "$fval"
    else
        cd $cur_dir
    fi
    echo " `pwd`"
    ls
}
alias cd1='cdf 1'
alias cd2='cdf 2'
alias cd3='cdf 3'
alias cd4='cdf 4'

#############################################################
# gf - fuzzy open files in gvim
unalias gf 2> /dev/null
function gf() {
    if [ -z $TMUX  ]; then
        fzf_cmd="fzf -m"
    else
        fzf_cmd="fzf-tmux -m"
    fi
    if [[ $1 != '' ]]; then
        fval=$(fd -E .snapshot/ -t f -H -d $1| $fzf_cmd -preview 'bat --color=always --style=numbers --line-range=:500 {}') || return
        echo "gvim $fval"
        g $fval
    else
        fval=$(fd -E .snapshot/ -t f -H | $fzf_cmd --preview 'bat --color=always --style=numbers --line-range=:500 {}') || return
        echo "gvim $fval"
        g $fval
    fi
}
alias gf1='gf 1'
alias gf2='gf 2'
alias gf3='gf 3'
alias gf4='gf 4'

#############################################################
# nf - fuzzy open files in nvim
unalias nf 2> /dev/null
function nf() {
    if [ -z $TMUX  ]; then
        fzf_cmd="fzf -m"
    else
        fzf_cmd="fzf-tmux -m"
    fi
    if [[ $1 != '' ]]; then
        fval=$(fd -E .snapshot/ -t f -H -d $1| $fzf_cmd --preview 'bat --color=always --style=numbers --line-range=:500 {}') || return
        echo "nvim $fval"
        n $fval
    else
        fval=$(fd -E .snapshot/ -t f -H | $fzf_cmd --preview 'bat --color=always --style=numbers --line-range=:500 {}') || return
        echo "nvim $fval"
        n $fval
    fi
}
alias nf1='nf 1'
alias nf2='nf 2'
alias nf3='nf 3'
alias nf4='nf 4'

#############################################################
# vf - fuzz view files
unalias vf 2> /dev/null
function vf() {
	  if [ -z $TMUX  ]; then
        fzf_cmd="fzf"
    else
        fzf_cmd="fzf-tmux"
    fi
    if [[ $1 != '' ]]; then
        fval=$(fd -E .snapshot/ -t f -H -d $1| $fzf_cmd -preview 'bat --color=always --style=numbers --line-range=:500 {}') || return
        v $fval
    else
        fval=$(fd -E .snapshot/ -t f -H | $fzf_cmd -preview 'bat --color=always --style=numbers --line-range=:500 {}') || return
        v $fval
    fi
}
alias vf1='vf 1'
alias vf2='vf 2'
alias vf3='vf 3'
alias vf4='vf 4'

#############################################################
# lf - fuzzy list directories/files
unalias lf 2> /dev/null
function lf() {
  cur_dir=`pwd`
	if [ -z $TMUX  ]; then
    fzf_cmd="fzf"
  else
    fzf_cmd="fzf-tmux"
  fi
  #fval=$(fd -E .snapshot/ -H -L | $fzf_cmd)
  fval=$(fd -H -L | fzf --prompt 'All> ' \
    --header 'CTRL-D: Directories / CTRL-F: Files' \
    --bind 'ctrl-d:change-prompt(Directories>)+reload(fd -t d -H -L)' \
    --bind 'ctrl-f:change-prompt(Files>)+reload(fd -t f -H -L)' \
    --preview '[ -f {} ] && bat --color=always --style=numbers --line-range=:500 {} || tree -C {}')
  for var in $fval
  do
    echo "ll $var"
    ll $var
  done
}

#############################################################
# rgf - old version
unalias rgf_old 2> /dev/null
function rgf_old() {
  # 1. Search for text in files using ripgrep
  # 2. Interactively narrow down the list using fzf
  # 3. Open the file in nvim
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi --height 90% \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --style=numbers --line-range=:500 --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(nvim {1} +{2})'
} 

#############################################################
# rgf - search for files and open them
unalias rgf 2> /dev/null
function rgf () {
  # Two-phase filtering with Ripgrep and fzf
  #
  # 1. Search for text in files using Ripgrep
  # 2. Interactively restart Ripgrep with reload action
  #    Switch between Ripgrep launcher mode (CTRL-R) and fzf filtering mode (CTRL-F)
  # 3. Open the file in Vim
  rm -f /tmp/rg-fzf-{r,f}
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --height 90% --query "$INITIAL_QUERY" \
    --bind "start:reload($RG_PREFIX {q})+unbind(ctrl-r)" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)" \
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \
    --prompt '1. ripgrep> ' \
    --delimiter : \
    --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱' \
    --preview 'bat --color=always {1} --style=numbers --line-range=:500 --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1} +{2})'
}

#############################################################
# rgc - search for count of expression in each file and choose file to open
unalias rgc 2> /dev/null
function rgc() {
  rm -f /tmp/rg-fzf-{r,f}
  RG_PREFIX="rg -c --color=always --smart-case"
  INITIAL_QUERY="${*:-}"
  : | fzf --ansi --disabled --height 90% --query "$INITIAL_QUERY" \
    --bind "start:reload($RG_PREFIX {q})+unbind(ctrl-r)" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)" \
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \
    --prompt '1. ripgrep> ' \
    --delimiter : \
    --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱' \
    --preview 'bat --color=always {1} --style=numbers --line-range=:500' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1})'
}

#############################################################
# ff - search through fasd file list and filer with fzf to open in nvim
unalias ff 2> /dev/null
function ff() {
  if [ $# == 0 ]; then
    file_list=`fasd -l -R -f`
    search_expr=""
  else
    search_expr=$1
  fi
  fasd -l -R -f | fzf --ansi --height 90% \
    --query "$search_expr" \
    --preview 'bat --color=always {1} --style=numbers --line-range=:500' \
    --bind 'enter:become(nvim {1})' \
    --bind 'up:preview-half-page-up,down:preview-half-page-down'
    --bind 'up:preview-half-page-up,down:preview-half-page-down'
}

#############################################################

alias sal='source ~/.alias.bash'
alias val='gvim ~/.alias.bash'
alias nal='nvim ~/.alias.bash'

