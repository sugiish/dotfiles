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

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
chpwd() { ls }

Setup fzf
---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

Key bindings
------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_OPTS='--reverse --border --bind ctrl-k:kill-line'
export FZF_TMUX_HEIGHT='60%'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

alias gl='cd $(ghq root)/$(ghq list | fzf)'
eval "$(rbenv init -)"
eval "$(jenv init -)"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
