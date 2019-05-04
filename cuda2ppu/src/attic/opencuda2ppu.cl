
typedef enum {
      GLOBAL_ID = 0,
      GROUP_ID,
      GLOBAL_ID_X,
      GLOBAL_ID_Y,
      GLOBAL_ID_Z,
      TID_X,
      TID_Y,
      TID_Z,
      TID_W,
      NTID_X,
      NTID_Y,
      NTID_Z,
      NTID_W,
      CTAID_X,
      CTAID_Y,
      CTAID_Z,
      CTAID_W,
      NCTAID_X,
      NCTAID_Y,
      NCTAID_Z,
      NCTAID_W,
      WARP_SIZE,
      /* add register definitions here */
      MAX_REG_ID
}global_register_id;

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

int get_global_id(int a)
{
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
