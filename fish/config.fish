if status is-interactive
    ### Hiding fish welcome message
    set fish_greeting

    ### fastfetch pretty output
    fastfetch

    ### ALIASES
    alias exa='eza'
    alias ls='exa -al --color=always --group-directories-first'
    alias vim='nvim'
    alias youtube-mp3='yt-dlp -x --audio-format mp3'
    alias cFormat='astyle --style=google -k3 -W3 -s -C -xG -xf -xh -S -K -H -xU -f -p -U -xg -j -xh -O -c -xb'
    alias termdown="termdown -f roman"
    alias figlet="pyfiglet -f larry3d"
    alias cls="clear"
    function boox
        echo $argv | boxes -d cc -a hcvc -s 80 -p v1
    end

    ### ENV
    set -Ux SUDO_EDITOR /usr/bin/nvim
    set -Ux GIT_EDITOR nvim

    ### Add to path
    fish_add_path -p ~/.cargo/bin/

    ### Sources
    thefuck --alias | source
    starship init fish | source
end

