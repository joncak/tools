### dotfiles
DOT_HOME=$HOME/tools
alias tmux="tmux -f $DOT_HOME/tmux.conf"
alias nvim="nvim -u $DOT_HOME/init.vim"

# alias
source $DOT_HOME/bash-alias

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

### history
export HISTSIZE=10000
export HISTFILESIZE=10000
PROMPT_COMMAND='history -a'

# editor
EDITOR=nvim

PS1='\w $(parse_git_branch)[\j]$ '

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
