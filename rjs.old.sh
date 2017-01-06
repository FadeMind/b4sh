#!/usr/bin/env bash

# Copyright (C) 2015 Tomasz Przybył <fademind@gmail.com>
# Homepage: https://github.com/FadeMind/archbash
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
# 
# https://www.gnu.org/licenses/gpl.txt

BD=$(tput bold)
NM=$(tput sgr0) 
SRCPATH=$(cat /etc/pacman.conf |grep CacheDir|awk '{print $3}'|head -c -2)
DSTPATH=/run/media/$(whoami)/WDElementsEXT4/ARCHLINUX/PACKAGES
DSTPCPATH=$DSTPATH/PACMAN-CURRENT.PKG
DSTPAPATH=$DSTPATH/PACMAN-ALL.PKG
RSYNCCMD="rsync --stats -h -r -t -v --progress --ignore-existing"

syncmade(){
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    printf "${NM}SRC: ${BD}$SRCPATH/ \n${NM}DST:${BD} $DSTPCPATH/${NM}\n"
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    $RSYNCCMD --delete -s $SRCPATH/ $DSTPCPATH/
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    printf "${BD}=+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=${NM}\n"
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    printf "${NM}SRC: ${BD}$DSTPCPATH/ \n${NM}DST:${BD} $DSTPAPATH/${NM}\n"
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    $RSYNCCMD -s $DSTPCPATH/ $DSTPAPATH/
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
}

pacmade(){
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    printf "${NM}SRC: ${BD}$DSTPCPATH/ \n${NM}DST:${BD} $SRCPATH/\n${NM}"
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
    sudo $RSYNCCMD -s $DSTPCPATH/ $SRCPATH/
    printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
}


if [ "$(whoami)" == "root" ]
then 
    echo "${BD}ERROR: Run this script as normal user!${NM}"
    exit 0
else
    if [ ! -d "$DSTPATH" ]; then
        echo "${BD}ERROR: Mount external HDD first!${NM}"
        exit 0
    else
        printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
        printf "${BD}BEFORE YOU USING THIS SCRIPT CUSTOMIZE VARIABLE ${NM}DSTPATH${BD} IN THE SCRIPT CODE ${NM}\n"
        printf "${BD}================================CURRENT PATHES VALUES================================${NM}\n"
        printf "${BD}Pacman Local Cache: ${NM}$SRCPATH/ \n"
        printf "${BD}External HDD:       ${NM}$DSTPATH/ \n"
        printf "${BD}=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${NM}\n"
        printf "${BD}Select ${NM}1${BD} and copy packages from ${NM}Pacman Local Cache${BD} to ${NM}External HDD.\n"
        printf "${BD}Select ${NM}2${BD} and copy packages from ${NM}External HDD${BD} to ${NM}Pacman Local Cache.\n"
        printf "${BD}Select any other key to exit.\n"
        printf "${BD}Enter number:${NM}"
        read SEL
        case "$SEL" in
            "1") syncmade;;
            "2") pacmade;;
            *) exit 0;;
        esac
    fi
fi