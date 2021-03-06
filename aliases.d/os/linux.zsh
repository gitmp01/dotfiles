# if we have a screen, we can try a colored screen
if [[ "$TERM" == "screen" ]]; then
    export TERM="screen-256color"
fi

# activate ls colors, (private if possible)
export ZSH_DIRCOLORS="$ZSH_CONFIG/dircolors-solarized/dircolors.256dark"
if [[ -a $ZSH_DIRCOLORS ]]; then
    if [[ "$TERM" == *256* ]]; then
        which dircolors > /dev/null && eval "`dircolors -b $ZSH_DIRCOLORS 2>/dev/null`"
    else
        # standard colors for non-256-color terms
        which dircolors > /dev/null && eval "`dircolors -b`"
    fi
else
    which dircolors > /dev/null && eval "`dircolors -b`"
fi

alias up=" nmcli con up id"
alias down=" nmcli con down id"

LSB_DISTRIBUTOR=`lsb_release -i -s`

# debian and ubuntu specific aliases
## autocomplete-able apt-xxx aliases
if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
    # apt {{{1
    alias apt='sudo apt-get'
    alias apti='sudo apt-get install'
    alias aptx='sudo apt-get remove'
    alias aptX='sudo apt-get uninstall'
    alias aptr='sudo apt-get install --reinstall'
    alias aptp='sudo apt-get purge'
    alias apts='sudo apt-cache search'
    alias aptshow='sudo apt-cache show'
    alias aptu='sudo apt-get update'
    alias aptU='sudo apt-get upgrade'
    alias aptdu='sudo apt-get dist-upgrade'
    alias aptar='sudo apt-get autoremove'

    alias ctl='sudo service '
    alias feierabend='sudo shutdown -h now'

    # dpkg {{{1
    alias dpl='dpkg -l'       # List
    alias dpi='sudo dpkg -i'  # Install
    alias dpr='sudo dpkg -r'  # Remove

    # autojump
    . /usr/share/autojump/autojump.sh

    # Others
    alias ack='ack-grep'
    alias open='nautilus'
fi

# arch linux with systemd aliases
if [[ "$LSB_DISTRIBUTOR" == "archlinux" ]]; then
    # statements
    alias ctl='sudo systemctl '
    alias feierabend='sudo systemctl start poweroff.target'
    alias start="sudo systemctl start"
    alias stop="sudo systemctl stop"
    alias status="sudo systemctl status"
    alias restart="sudo systemctl restart"
    alias reboot="sudo systemctl start reboot.target"
fi

alias afk="gnome-screensaver-command --lock"
