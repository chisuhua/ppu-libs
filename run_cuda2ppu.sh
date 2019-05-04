#!/bin/bash
# -*- coding: utf-8 -*-
$MLCC/bin/clang -S -emit-llvm -DCL_VERSION_2_0=200 -D__OPENCL_C_VERSION__=200 -Dcl_khr_fp64 -Dcl_khr_fp16 -Dcl_khr_subgroups -Dcl_khr_int64_base_atomics -Dcl_khr_int64_extended_atomics -x cl -Xclang -cl-std=CL2.0 -Xclang -finclude-default-header -target amdgcn-amd-amdhsa -I./ockl/inc -I./ocml/inc -I./irif/inc -I./cuda2ppu/src -I$MLCC/include ./cuda2ppu/src/attic/opencuda2ppu.cl -o opencuda2ppu.ll
