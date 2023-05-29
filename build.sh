#!/bin/bash -ex

# https://blog.wataridori.co.jp/2017/12/post-370/
# http://tokis.cocolog-nifty.com/blog/2014/05/kozosgcc-490w-1.html


DIR=$(pwd)

: build binutils

if [ ! -e binutils-2.40.tar.bz2 ]; then
    curl -LO http://ftp.gnu.org/gnu/binutils/binutils-2.40.tar.bz2
fi

if [ ! -d binutils-2.40 ]; then
    tar jxvf binutils-2.40.tar.bz2
fi

cd binutils-2.40
./configure            \
    --target=h8300-elf \
    --disable-nls      \
    --disable-werror   \
    --prefix=$DIR/tools
make -j$(nproc) && make install

if [ ! $? = 0 ]; then
    exit 1
fi

cd $DIR

: build gcc

if [ ! -e gcc-7.3.0.tar.gz ]; then
    wget http://core.ring.gr.jp/pub/GNU/gcc/gcc-7.3.0/gcc-7.3.0.tar.gz
fi

if [ ! -d gcc-7.3.0 ]; then
    tar zxvf gcc-7.3.0.tar.gz
fi

# patch -p0 < ../../collect2.c.patch
#
# wget http://kozos.jp/books/makeos/patch-gcc-3.4.6-x64-h8300.txt
# patch -p0 < patch-gcc-3.4.6-x64-h8300.txt

if [ ! -d build ]; then
    mkdir build
fi

cd build
../gcc-7.3.0/configure   \
    --target=h8300-elf   \
    --disable-nls        \
    --disable-threads    \
    --disable-shared     \
    --enable-languages=c \
    --disable-werror     \
    --disable-libssp     \
    --prefix=$DIR/tools

make -j$(nproc)&& make install

