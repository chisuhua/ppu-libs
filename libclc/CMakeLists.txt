set(MLCC $ENV{MLCC})
if(MLCC)
	set(LLVM_COMPILER ${MLCC})
else()
  set(LLVM_COMPILER "/usr/local/mlcc")
endif()


set(libclc_bc_output ${CMAKE_CURRENT_SOURCE_DIR}/libclc/built_libs/ppu--.bc)
add_custom_command(
    OUTPUT  ${libclc_bc_output}
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/run_build.sh
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/libclc/README.TXT)
add_custom_target(libclc_bc_output  ALL DEPENDS ${libclc_bc_output})

set(libclc_ll_output ${CMAKE_CURRENT_SOURCE_DIR}/libclc/built_libs/ppu--.ll)
add_custom_command(
    OUTPUT  ${libclc_ll_output}
    COMMAND ${MLCC}/bin/llvm-dis ${libclc_bc_output} -o ${libclc_ll_output}
    DEPENDS ${libclc_bc_output})
add_custom_target(libclc_ll_output  ALL DEPENDS ${libclc_ll_output})


# FIXME generate header file here
# set(libclc_ll_output ppu--.bc)
set(libclc_header_output ${CMAKE_CURRENT_SOURCE_DIR}/libclc/built_libs/ppu--_ll.h)
add_custom_command(
    OUTPUT ${libclc_header_output}
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/../make_header_from_ll_defines.sh ${libclc_ll_output} ${libclc_header_output}
    DEPENDS ${libclc_ll_output})
add_custom_target(libclc_header_output  ALL DEPENDS ${libclc_header_output})


install(FILES ${libclc_bc_output} DESTINATION lib)
