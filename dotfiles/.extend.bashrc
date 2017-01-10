#
# ~/.extend.bashrc
#

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete

export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/nano
export VISUAL=$EDITOR
export BROWSER=/usr/bin/xdg-open
export KDE_DEBUG=1
export SAL_USE_VCLPLUGIN=gtk
export QT_PLUGIN_PATH=/usr/lib/qt/plugins

keychain ~/.ssh/id_rsa --quiet
. ~/.keychain/$HOSTNAME-sh

PS1='[\u@\h \W]\$ '
