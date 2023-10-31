zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true

autoload -Uz colors
colors

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt share_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
HIST_STAMPS="yyyy-mm-dd"

bindkey -e

# When using cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt no_beep
setopt no_list_beep

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions
zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
zinit ice wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -alFG'
chpwd() { ls }

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_OPTS='--reverse --border --bind ctrl-k:kill-line'
export FZF_TMUX_HEIGHT='60%'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

alias gl='cd $(ghq root)/$(ghq list | fzf)'
function _ghq_list_jump() {
  gl
}
zle -N _ghq_list_jump
bindkey '^G' _ghq_list_jump

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
### End of Zinit's installer chunk

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

