#
# ~/.bash_aliases
#

alias aliases="cat $HOME/.bash_aliases|grep 'alias '"
alias ccat='pygmentize -g'
alias cp="cp -i"            # confirm before overwriting something
alias df='df -hT'           # human-readable sizes
alias free='free -mh'       # show sizes in GB
alias freem="sudo bash -c 'free -h && sync && echo 3 > /proc/sys/vm/drop_caches && free -h'" 
alias gc='git clone'
alias grep='grep --color=tty -d skip'
alias kdl="kdesu dbus-launch"
alias kz='sudo kill -9'
alias la='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ls='ls -h --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias mb='export LANG=C;makepkg -src'
alias pacex='sudo pacman -D --asexplicit'
alias pacin='export LANG=C;yes|sudo pacman -U *.pkg.tar.xz'
alias paclean='sudo rm /var/cache/pacman/*/* &> /dev/null;'
alias ping='ping -4' # ping ipv4
alias saidar='saidar -c'
alias src='source .bashrc'
alias upy='yaourt -Syua --noconfirm'
alias ws='watch sensors'
alias zombie='ps axo stat,ppid,pid,comm | grep -w defunct'
alias pun='sudo rm /var/lib/pacman/db.lck'
alias aur-commit="mksrcinfo && git add --all && git commit -am 'update' && git push -u origin master"
alias git-commit="git add --all && git commit -am \"updates 20$(date +%y%m%d)\" && git push -u origin master"
