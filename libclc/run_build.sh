#!/bin/bash
# -*- coding: utf-8 -*-

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $THIS_SCRIPT_DIR/libclc

ln -s ../ppu_configure.py .

#./configure.py --with-llvm-config=../build/llvm/bin/llvm-config ppu-- ppu64--
#./configure.py --with-llvm-config=../build/llvm/bin/llvm-config r600--
./ppu_configure.py --with-llvm-config=$MLCC/bin/llvm-config ppu--

PROC=`uname -p`
NUM_THREADS=
if [ ! -z `which "getconf"` ]; then
   NUM_THREADS=$(`which "getconf"` _NPROCESSORS_ONLN)
fi

echo make -j $NUM_THREADS ppu--/lib/builtins.opt.bc
make -j $NUM_THREADS ppu--/lib/builtins.opt.bc

echo make utils/prepare-builtins
make utils/prepare-builtins

echo make all
make all

#PPU_DEVICE_BUILD_DIR=$MLCC_BUILD_DIR/rocm-device-libs
#make install DESTDIR=$PPU_DEVICE_BUILD_DIR/libclc
