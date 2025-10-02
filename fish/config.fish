if status is-interactive
    # =============================================
    # ~/.config/fish/config.fish
    # =============================================
    # Hiding fish welcome message
    set fish_greeting

    # =============================================
    # GIT
    # =============================================
    function setup_ssh_agent
        set -g env ~/.ssh/Agent_Fish.env

        function agent_load_env
            test -f $env; and source $env > /dev/null
        end

        function agent_start
            umask 077; ssh-agent -c > $env
            source $env > /dev/null
        end

        agent_load_env

        # Check agent run state
        ssh-add -l > /dev/null 2>&1
        set -l agent_run_state $status
        # 0=agent running w/ key; 1=agent w/o key; 2=agent not running

        if test -z "$SSH_AUTH_SOCK"; or test $agent_run_state -eq 2
            echo "Starting SSH agent..."
            agent_start
            ssh-add
        else if test -n "$SSH_AUTH_SOCK"; and test $agent_run_state -eq 1
            echo "SSH agent running but no keys loaded, adding keys..."
            ssh-add
        else
            echo "SSH agent is already running with keys loaded."
            ssh-add -l
        end

        functions -e agent_load_env agent_start

        set -g -e env
    end

    # =============================================
    # Welcome thingy
    # =============================================
    fastfetch

    # =============================================
    # Sources
    # =============================================
    thefuck --alias | source
    starship init fish | source

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

    function boox
        echo $argv | boxes -d cc -a hcvc -s 80 -p v1
    end

    # =============================================
    # Env
    # =============================================
    set -Ux SUDO_EDITOR /usr/bin/nvim
    set -Ux GIT_EDITOR nvim
    set -Ux EDITOR nvim

    # Custom paths
    set -Ux GITCLONES_DIR $HOME/.git-clones

    # =============================================
    # Cargo
    # =============================================
    fish_add_path -p ~/.cargo/bin/
end
