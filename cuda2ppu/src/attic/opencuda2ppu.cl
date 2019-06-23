#include "ppu_builtin_define.h"

#define __x86_64__ 1
#include "aco_device.h"

/*
__global int *g_global_memory = 0;

void init_global_memory(__global int *in)
{
    g_global_memory = in;
}

int read_register(int reg_id)
{
   if (reg_id >= MAX_REG_ID) return 0;
   return g_global_memory[reg_id];
}
*/

extern int __builtin_read_register(aco_ctx_t* co, int reg_id);

// it is cpu version of builtin
int read_register(int reg_id)
{
    // the llvm pass will hack this function to pass co throught argument
    aco_ctx_t* co;
    return __builtin_read_register(co, reg_id);
}

int get_global_id(int a) {
    return read_register(GLOBAL_ID);
}

#define ATTR __attribute__((const))

ATTR int nvvm_read_ptx_sreg_tid_x() {
    return read_register(TID_X);
}
ATTR int nvvm_read_ptx_sreg_tid_y() {
    return read_register(TID_Y);
}
ATTR int nvvm_read_ptx_sreg_tid_z() {
    return read_register(TID_Z);
}
ATTR int nvvm_read_ptx_sreg_tid_w() {
    return read_register(TID_W);
}

ATTR int nvvm_read_ptx_sreg_ntid_x() {
    return read_register(NTID_X);
}
ATTR int nvvm_read_ptx_sreg_ntid_y() {
    return read_register(NTID_Y);
}
ATTR int nvvm_read_ptx_sreg_ntid_z() {
    return read_register(NTID_Z);
}
ATTR int nvvm_read_ptx_sreg_ntid_w() {
    return read_register(NTID_W);
}

ATTR int nvvm_read_ptx_sreg_ctaid_x() {
    return read_register(CTAID_X);
}
ATTR int nvvm_read_ptx_sreg_ctaid_y() {
    return read_register(CTAID_Y);
}
ATTR int nvvm_read_ptx_sreg_ctaid_z() {
    return read_register(CTAID_Z);
}
ATTR int nvvm_read_ptx_sreg_ctaid_w() {
    return read_register(CTAID_W);
}

ATTR int nvvm_read_ptx_sreg_nctaid_x() {
    return read_register(NCTAID_X);
}
ATTR int nvvm_read_ptx_sreg_nctaid_y() {
    return read_register(NCTAID_Y);
}
ATTR int nvvm_read_ptx_sreg_nctaid_z() {
    return read_register(NCTAID_Z);
}
ATTR int nvvm_read_ptx_sreg_nctaid_w() {
    return read_register(NCTAID_W);
}
ATTR int nvvm_read_ptx_sreg_warpsize() {
    return read_register(WARP_SIZE);
}

/*
 * add stub functions that kernel called here.
 * the return value can be get from global memory.
 * add your new registers in global_memory.h, then
 * configure the new added register int IsaExecutor->Run()
 * before executing kernel.
 */
