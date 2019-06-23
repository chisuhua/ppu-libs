#!/bin/bash
# -*- coding: utf-8 -*-

$MLCC/bin/clang -S -emit-llvm -DCL_VERSION_2_0=200 -D__OPENCL_C_VERSION__=200 -Dcl_khr_fp64 -Dcl_khr_fp16 -Dcl_khr_subgroups -Dcl_khr_int64_base_atomics -Dcl_khr_int64_extended_atomics -x cl -Xclang -cl-std=CL2.0 -Xclang -finclude-default-header -target amdgcn-amd-amdhsa -I./ockl/inc -I./ocml/inc -I./irif/inc -I./cuda2ppu/src -I$MLCC/include ./cuda2ppu/src/attic/opencuda2ppu.cl -o opencuda2ppu.ll -I$MLVM_ROOT/../tools/coroutine/kernel_aco

sed -i  's/nvvm_read_ptx_sreg_tid_/nvvm.read.ptx.sreg.tid./' opencuda2ppu.ll
sed -i  's/nvvm_read_ptx_sreg_ntid_/nvvm.read.ptx.sreg.ntid./' opencuda2ppu.ll
sed -i  's/nvvm_read_ptx_sreg_ctaid_/nvvm.read.ptx.sreg.ctaid./' opencuda2ppu.ll
sed -i  's/nvvm_read_ptx_sreg_nctaid_/nvvm.read.ptx.sreg.nctaid./' opencuda2ppu.ll
sed -i  's/nvvm_read_ptx_sreg_/nvvm.read.ptx.sreg./' opencuda2ppu.ll
#sed -i  's/undef/co_ctx/' opencuda2ppu.ll

# x86 backend ppu
#echo "gcc -c -fPIC -I$MLVM_ROOT/../tools/coroutine/stackfull_aco ./cuda2ppu/src/attic/cpu_builtin.cpp -o cpu_builtin.o"
#gcc -c -fPIC -I$MLVM_ROOT/../tools/coroutine/stackfull_aco ./cuda2ppu/src/attic/cpu_builtin.cpp -o cpu_builtin.o


echo "Done, please copy opencuda2ppu.ll to cuda2ppu/src"
#echo "NOTE: __build_read_register argument input is undef"
