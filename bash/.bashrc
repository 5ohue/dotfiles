# =============================================
# ~/.bashrc
# =============================================
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# =============================================
# GIT
# =============================================
setup_ssh_agent() {
    local env=~/.ssh/Agent_Bash.env

    agent_load_env() {
        test -f "$env" && . "$env" >| /dev/null
    }

    agent_start() {
        (umask 077; ssh-agent >| "$env")
        . "$env" >| /dev/null
    }

    agent_load_env

    # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
    local agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

    if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
        echo "Starting SSH agent..."
        agent_start
        ssh-add
    elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
        echo "SSH agent running but no keys loaded, adding keys..."
        ssh-add
    else
        echo "SSH agent is already running with keys loaded."
        ssh-add -l
    fi

    unset env
}

# =============================================
# Welcome thingy
# =============================================
if command -v pyfiglet > /dev/null && command -v lolcat > /dev/null; then
    pyfiglet -f soft "Bashin!" | lolcat -r
else
    if command -v pyfiglet > /dev/null; then
        pyfiglet -f soft "Bashin!"
    fi
fi

# =============================================
# Colored prompt
# =============================================
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# =============================================
# Aliases
# =============================================
alias ls='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'

# Safety first
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gp='git push'
alias gpl='git pull'

# Stuff
alias youtube-mp3='yt-dlp -t mp3'
alias cFormat='astyle --style=google -k3 -W3 -s -C -xG -xf -xh -S -K -H -xU -f -p -U -xg -j -xh -O -c -xb'
alias termdown="termdown -f roman"
alias figlet="pyfiglet -f larry3d"
alias cls="clear"

# =============================================
# Env
# =============================================
# Editor
export SUDO_EDITOR="/usr/bin/nvim"
export GIT_EDITOR="nvim"
export EDITOR="nvim"

# Custom paths
export GITCLONES_DIR="$HOME/.git-clones"

# =============================================
# Cargo
# =============================================
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
