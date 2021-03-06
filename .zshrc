# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git last-working-dir wd vi-mode)

source $ZSH/oh-my-zsh.sh

# Set aliases in seperate file
source ~/.aliases

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt histverify
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt hist_ignore_space
HISTSIZE=10000
SAVEHIST=10000

#Set backsearch
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey -a "k" history-beginning-search-backward
bindkey -a "j" history-beginning-search-forward

#Fix some vim keybindings http://zshwiki.org/home/zle/vi-mode
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

vi-backward-word-end() {
zle vi-forward-word-end
  zle vi-backward-word -n 2 && zle vi-forward-word-end
}
vi-backward-blank-word-end() {
  zle vi-forward-blank-word-end
  zle vi-backward-blank-word -n 2 && zle vi-forward-blank-word-end
}

# Lower keybinding timeout http://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1

#
# Fix random keys that don't work
#
# Insert
bindkey '\e[2~' overwrite-mode
# Delete
bindkey '\e[3~' delete-char
# Home
bindkey '\e[7~' beginning-of-line
# End
bindkey '\e[8~' end-of-line
# Page Up
bindkey '\e[5~' history-beginning-search-backward
# Page Down
bindkey '\e[6~' history-beginning-search-forward
# Remove scary words all over the place
unset GREP_OPTIONS
