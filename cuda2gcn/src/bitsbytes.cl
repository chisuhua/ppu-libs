/*===--------------------------------------------------------------------------
 *                   ROCm Device Libraries
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *===------------------------------------------------------------------------*/

#include "ockl.h"
#include "irif.h"


extern __attribute__((const)) int __llvm_bitreverse_i32(int) __asm("llvm.bitreverse.i32");
extern __attribute__((const)) long __llvm_bitreverse_i64(long) __asm("llvm.bitreverse.i64");
extern __attribute__((const)) int __llvm_ctpop_i32(int) __asm("llvm.ctpop.i32");
extern __attribute__((const)) long __llvm_ctpop_i64(long) __asm("llvm.ctpop.i64");

#define ATTR __attribute__((always_inline, const))

//-------- T __nv_brev
ATTR int __nv_brev(int x) { return __llvm_bitreverse_i32(x); }

//-------- T __nv_brevll
ATTR long __nv_brevll(long x) { return __llvm_bitreverse_i64(x); }

//-------- T __nv_clz
ATTR int __nv_clz(int x)
{
    return (int)__ockl_clz_u32((uint)x);
}

//-------- T __nv_clzll
ATTR int __nv_clzll(long x)
{
    uint xlo = (uint)x;
    uint xhi = (uint)(x >> 32);
    uint zlo = __ockl_clz_u32(xlo) + 32u;
    uint zhi = __ockl_clz_u32(xhi);
    return (int)(xhi == 0 ? zlo : zhi);
}

//-------- T __nv_ffs
ATTR int __nv_ffs(int x) { return (32 - __nv_clz(x&(-x))); }

//-------- T __nv_ffsll
ATTR int __nv_ffsll(long x) { return (int)(64 - __nv_clzll(x&(-x))); }

//-------- T __nv_popc
ATTR int __nv_popc(int x) { return __llvm_ctpop_i32(x); }

//-------- T __nv_popcll
ATTR int __nv_popcll(long x) { return (int)__llvm_ctpop_i64(x); }

