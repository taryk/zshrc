# ~/zsh/init.zsh - ZSH initial script
#
# Author: Taras Iagniuk <mrtaryk@gmail.com>
# Version: 0.3
# keywords: zsh shell emacs perl

export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTTIMEFORMAT="%Y-%m-%d %H:%I:%S %T "
# eval `dircolors -b`

setopt extendedhistory
setopt append_history

# To save every command before it is executed
setopt inc_append_history

# To retrieve the history file everytime history is called upon
setopt share_history

setopt autocd
setopt extended_glob
setopt correct

setopt hist_expire_dups_first

# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

autoload -U compinit
compinit -C

# colorized
autoload -U colors && colors

# {{ edit command line in external editor
autoload -U edit-command-line
zle -N edit-command-line

# Emacs style keys
bindkey -e

bindkey '\C-x\C-e' edit-command-line
# }}

bindkey '^r' history-incremental-search-backward
bindkey -s "\C-h" "history\r"

bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word

bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward

bindkey    "^[[A" history-beginning-search-backward
bindkey -a "^[[A" history-beginning-search-backward
bindkey    "^[[B" history-beginning-search-forward
bindkey -a "^[[B" history-beginning-search-forward

# hosts=(192.168.1.1
#        192.168.1.2
#        192.168.1.5)
# zstyle '*' hosts $hosts

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' add-space true
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true

# fpath=(~/.zsh/functions $fpath)

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if type -P emacsclient >/dev/null 2>&1; then
  export EDITOR=emacsclient
else
  export EDITOR='emacs -nw'
fi


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    eval `dircolors`
    alias ls='ls --color=auto -F'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'

    #
    # Shell Job completed to remind
    # for urxvt:
    # URxvt.urgentOnBell: True
    # for bash:
    # export PROMPT_COMMAND="echo -ne '\a'"
    # for zsh:
    precmd () (
        echo -ne '\a'
    )
fi

## Proxies
# export http_proxy='http://192.168.0.1:8080/'
# export ftp_proxy='http://192.168.0.1:8080/'

autoload promptinit
promptinit
# prompt zefram

# 
# Aliases
#

alias sdr="screen -aAdr"
alias la="ls -hAF"
alias ll="ls -lAF"
alias li='ls -hial'
alias ls='ls -hF --color=auto'
alias lsa='ls -hld .*'
alias lsd='ls -hld *(-/DN)'
alias mv='nocorrect mv -i'
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'
alias rmrf='nocorrect rm -fR'
alias ps='nocorrect ps auxww'
alias grep='grep --exclude="*.svn*"'
alias sudos="sudo -s"
alias mkpasswd="head -c5 /dev/urandom | xxd -ps"
alias mkpath='mkdir -p'
alias ..='cd ..'
alias cd..='cd ..'
alias -- -='cd -'
alias sshx='ssh -X'
alias cache_drop='sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"'
alias cache_drop_2='sudo sh -c "echo 2 > /proc/sys/vm/drop_caches"'
alias cache_drop_3='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'

alias new_login_in_window='gdmflexiserver --xnest'
alias new_login='gdmflexiserver'
alias todays_files='find . -mtime -1 -print'

# alias netbeans_gtk='/usr/local/netbeans/bin/netbeans --laf GTK'
alias z='ps -Af | grep'

# for awesome wm test
alias awetest="Xephyr -ac -br -noreset -screen 800x600 :1 & sleep 1 && DISPLAY=:1.0 awesome -c ~/.config/awesome/rc.lua"

alias -g G='| grep'
alias -g GI='| grep -i'
alias -g GIR='| grep -ir'
alias -g H='| head'
alias -g L='| less'
alias -g M='| more'
alias -g N='2>/dev/null'
alias -g T='| tail'
alias -g TF='| tail -f'

IMAGE_VIEWER='geeqie'
OFFICE_WRITER='libreoffice --writer --nologo'
OFFICE_TABLES='libreoffice --calc --nologo'
PDF_VIEWER='okular'
PLAINTEXT_EDITOR=$EDITOR
VIDEO_PLAYER='smplayer'
# AUDIO_PLAYER='mpg123'
AUDIO_PLAYER='mplayer'

# suffix based alias
alias -s {asf,avi,divx,flv,mkv,mp4,mpg,ogp,ts,vob,wmv}=$VIDEO_PLAYER
alias -s {mp3,ogg,flac}=$AUDIO_PLAYER
alias -s {conf,cfg,ini,txt}=$PLAINTEXT_EDITOR
alias -s {org}=$EDITOR
alias -s {doc,docx,odt}=$OFFICE_WRITER
alias -s exe='wine'
alias -s {jpeg,jpg,png,gif}=$IMAGE_VIEWER
alias -s {ods,xls,xlsx}=$OFFICE_TABLES
alias -s {pdf,djvu,epub}=$PDF_VIEWER

# directories
b=$HOME/bin ;           : ~b
D=$HOME/Downloads ;     : ~D
Db=$HOME/Dropbox ;      : ~Db
Dev=$HOME/Development ; : ~Dev
M=$HOME/Music ;         : ~M
f=/mnt/flash ;          : ~f
l=/var/log ;            : ~l
e=/etc ;                : ~e

ZSHRCDIR="${HOME}/.zsh/"
ZSHEXTENSIONS="${ZSHRCDIR}/extensions/"

# re-compile zsh rc files
src() {
  autoload -U zrecompile

  [ -f $ZSHRCDIR/init.zsh ] && zrecompile -p $ZSHRCDIR/init.zsh
  [ -f $ZSHRCDIR/init.zsh.zwc.old ] && rm -f $ZSHRCDIR/init.zsh.zwc.old

  [ -f $HOME/.zshrc.local ] && zrecompile -p $HOME/.zshrc.local
  [ -f $HOME/.zshrc.local.zwc.old ] && rm -f $HOME/.zshrc.local.zwc.old

  if [ -e $ZSHEXTENSIONS ]; then
    for zshrcfile in $ZSHEXTENSIONS/*.zsh ; do
      zrecompile -p $zshrcfile
      [ -f "${zshrcfile}.zwc.old" ] && rm -f "${zshrcfile}.zwc.old"
    done
  fi

  source $ZSHRCDIR/init.zsh
}

# source local zshalias
if [ -e ~/.zshalias.local ]; then
  source ~/.zshalias.local
fi

# load files from ~/.zsh/*.zsh
if [ -e $ZSHEXTENSIONS ]; then
  for zshrcfile in $ZSHEXTENSIONS/*.zsh ; do
    source $zshrcfile
  done
fi

#
# Puts ~/bin to PATH if exists
#
if [ -d ~/bin ] ; then
  PATH=~/bin:"${PATH}"
fi
