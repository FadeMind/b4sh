#!/usr/bin/env bash
URL=http://repos.uni-plovdiv.net/archlinux/llvm-svn
VER32=3.9.0svn_r271108-1
VER64=3.9.0svn_r271108-1
ARCH=x86_64

for F in clang-analyzer clang-compiler-rt clang clang-tools-extra llvm-libs llvm-ocaml llvm
do
    if [ ! -f "$F-svn-$VER64-$ARCH.pkg.tar.xz" ];then
        aria2c $URL/$ARCH/$F-svn-$VER64-$ARCH.pkg.tar.xz
    else
        printf "File $F-svn-$VER64-$ARCH.pkg.tar.xz exists.\n"
    fi
done

for F in lib32-clang lib32-llvm lib32-llvm-libs
do
    if [ ! -f "$F-svn-$VER32-$ARCH.pkg.tar.xz" ];then
        aria2c $URL/$ARCH/$F-svn-$VER32-$ARCH.pkg.tar.xz
    else
        printf "File $F-svn-$VER32-$ARCH.pkg.tar.xz exists.\n"
    fi
done
