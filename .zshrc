# Line configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory extendedglob notify
unsetopt nomatch
bindkey -e

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#403f4c,underline"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dc/.zshrc'

autoload -Uz compinit
compinit
#End of lines added by compinstall
autoload -U colors && colors

autoload -Uz vcs_info
precmd() { vcs_info }

EDITOR='vim'
PATH=$PATH:~/.cargo/bin:~/.local/bin:~/.local/share/gem/ruby/2.7.0/bin:~/go/bin/

setopt promptsubst

zstyle ":vcs_info:git:*" formats '%b - %r/%S'

local SSH_HOST USER_TYPE USER_PROMPT CURRENT_DIR RETURN_CODE

RETURN_CODE="%(?..%F{red}%? %{$reset_color%})"

if [[ $UID -ne 0 ]]; then
    USER_TYPE="%B%F{green}$%b"
else
    USER_TYPE="%B%F{red}#%b"
fi

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    SSH_HOST="%F{cyan}%M%f" # SSH
else
    SSH_HOST="%F{red}%M%f" # NO SSH
fi

CURRENT_DIR="%B%F{blue}%~%f%b"

PROMPT='${USER_TYPE} ${SSH_HOST} ${CURRENT_DIR} %B%F{yellow}${vcs_info_msg_0_}%f%b
%F{yellow}>>%f '
RPROMPT='%B${RETURN_CODE}%b'

# aliases

alias l='ls -lha'
alias gc='pushd ~/GIT && git clone'
alias gnc='git clone'
alias ls='ls --color=auto'
alias bat='cat /sys/class/power_supply/BAT0/capacity'

alias del='trash'
alias rm='echo Use del or use full path /bin/rm'

alias wpm='python3 -m wpm'
alias emacs='emacs -nw'
alias upload-zip='curl --user Dhruv: smb://192.168.100.211/Public/ -T'

source ~/GIT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias cp-set="sudo ryzen-controller --no-sandbox"

alias htpo=htop
alias hpto=htop
alias hpot=htop
alias hotp=htop
alias hopt=htop
alias thop=htop
alias thpo=htop
alias tpoh=htop
alias tpho=htop
alias tohp=htop
alias toph=htop
alias phot=htop
alias phto=htop
alias ptho=htop
alias ptoh=htop
alias poth=htop
alias poht=htop
alias opht=htop
alias opth=htop
alias otph=htop
alias othp=htop
alias ohtp=htop
alias ohpt=htop
# -- START ACTIVESTATE DEFAULT RUNTIME ENVIRONMENT
export PATH="/home/dc/.cache/activestate/bin:$PATH"
# -- STOP ACTIVESTATE DEFAULT RUNTIME ENVIRONMENT
alias minecraft='java -jar /mnt/gorbage/TLauncher-2.82/TLauncher-2.82.jar'
alias vim='vim -T xterm_256color'
alias ufetch='~/GIT/ufetch/ufetch-debian'

function isfile() {
    [[ -n "${1}" ]] && ([[ -f "${1}" ]] && echo 'Yes' || echo 'No') || echo 'Expected file name';
}

function isdir() {
    [[ -n "${1}" ]] && ([[ -d "${1}" ]] && echo 'Yes' || echo 'No') || echo 'Expected dir name';
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

alias java17=/usr/lib/jvm/java-17-openjdk-amd64/bin/java
alias mc='use-nvidia "java -jar /mnt/gorbage/TLauncher-2.82/TLauncher-2.82.jar"'

export CLASSPATH=/home/dc/Downloads/Executable/mysql-connector-java-8.0.27/mysql-connector-java-8.0.27.jar:$CLASSPATH

alias cat=batcat
alias lock='DISPLAY=:1 /usr/local/bin/betterlockscreen --lock /home/dc/Pictures/Wallpapers/4roxk1nqz4911.png'
