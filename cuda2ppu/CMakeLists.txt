##===----------------------------------------------------------------------===##
#
#                     The LLVM Compiler Infrastructure
#
# This file is dual licensed under the MIT and the University of Illinois Open
# Source Licenses. See LICENSE.txt for details.
##===----------------------------------------------------------------------===##
#
# ppu-libs/cuda2ppu/CMakeLists.txt
#
##===----------------------------------------------------------------------===##

#  Try to get LLVM_COMPILER from HIP, then MLCC , then default /usr/local/hip
set(MLCC $ENV{MLCC})
if(MLCC)
	set(LLVM_COMPILER ${MLCC})
else()
  set(LLVM_COMPILER "/usr/local/mlcc")
endif()

# Assome rocm-device-libs repository is next to hcc2-hip repository 
set(ROCDL ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(ROCDL_INC_OCKL ${ROCDL}/ockl/inc)
set(ROCDL_INC_OCML ${ROCDL}/ocml/inc)
set(ROCDL_INC_IRIF ${ROCDL}/irif/inc)
set(LIBCLC_BUILT_LIBS ${ROCDL}/libclc/libclc/built_libs)

set(libname "cuda2ppu")
message("---> Building ${libname} with Compiler ${LLVM_COMPILER}")
project(${libname})

file(GLOB ll_sources "${CMAKE_CURRENT_SOURCE_DIR}/src/*.ll")
file(GLOB ocl_sources "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cl")

#  OpenCL files are no longer gfx specific, so only build them one time
set(cl_cmd ${LLVM_COMPILER}/bin/clang
    -S -emit-llvm
    -DCL_VERSION_2_0=200 -D__OPENCL_C_VERSION__=200
    -Dcl_khr_fp64 -Dcl_khr_fp16
    -Dcl_khr_subgroups -Dcl_khr_int64_base_atomics -Dcl_khr_int64_extended_atomics
    -x cl -Xclang -cl-std=CL2.0 -Xclang -finclude-default-header
    -target amdgcn-amd-amdhsa
    -I${ROCDL_INC_OCKL}
    -I${ROCDL_INC_OCML}
    -I${ROCDL_INC_IRIF}
    -I${LIBCLC_BUILT_LIBS}
    -I${CMAKE_CURRENT_SOURCE_DIR}/src
    -I${LLVM_COMPILER}/include)
set(cl_ll_files)
foreach(file ${ocl_sources})
  file(RELATIVE_PATH rfile ${CMAKE_CURRENT_SOURCE_DIR}/src ${file})
  get_filename_component(fname ${rfile} NAME_WE)
  set(ll_filename ${fname}.ll)
  add_custom_command(
    OUTPUT ${ll_filename}
    COMMAND ${cl_cmd} ${file} -o ${ll_filename} 
    DEPENDS ${file} libclc_header_output)
  list(APPEND cl_ll_files ${ll_filename})
endforeach()

#Link all llfiles from cl and ll files
add_custom_command(
    OUTPUT linkout.bc
    COMMAND ${LLVM_COMPILER}/bin/llvm-link ${cl_ll_files} ${ll_sources} -o linkout.bc
    DEPENDS ${cl_ll_files} ${ll_sources})
add_custom_target(linkout-bc  ALL DEPENDS linkout.bc)


# this is workaround since clang is still looking for cuda2gcn.amdgcn.bc with cuda-open option
#set(cuda2ppu_bc_filename cuda2gcn.amdgcn.bc)
set(cuda2ppu_bc_filename cuda2gcn.amdgcn.bc)
add_custom_command(
    OUTPUT ${cuda2ppu_bc_filename}
    COMMAND ${LLVM_COMPILER}/bin/prepare-builtins linkout.bc -o ${cuda2ppu_bc_filename}
    DEPENDS linkout.bc )
add_custom_target(fake_cuda2ppu ALL DEPENDS ${cuda2ppu_bc_filename})

set(final_bc_filename ${libname}.ppu.bc)
add_custom_command(
    OUTPUT ${final_bc_filename}
    COMMAND ${LLVM_COMPILER}/bin/prepare-builtins linkout.bc -o ${final_bc_filename}
    DEPENDS linkout.bc )
add_custom_target(${libname} ALL DEPENDS ${final_bc_filename} ${cuda2ppu_bc_filename})


install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${final_bc_filename} DESTINATION lib)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${cuda2ppu_bc_filename} DESTINATION lib)
