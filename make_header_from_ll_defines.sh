#!/bin/bash

# make_header_from_ll_defines.sh:
#    To use low level hc functions maintained in .ll, we need c/cpp headers so
#    we can use them properly in hip device library implementations.
#
# Usage: To build /tmp/hc_atomic_ll.h file run this command
#
#    make_header_from_ll_defines.sh $HOME/git/hcc2/rocm-device-libs/hc/src/hc_atomic.ll
#

llfile=${1:-ppu--.ll}
output_header=$2;
outfn=${llfile##*/}
outfn="${outfn%.*}_ll.h"

outfile=/tmp/$outfn
if [ -f $outfile ] ; then
  echo removing old version of $outfile
  rm -f $outfile
fi
touch $outfile

echo "//" >> $outfile
echo "// This file $outfn was created by $0 " >> $outfile
echo "// from input file: $llfile  " >> $outfile
echo "// on `date` " >> $outfile
echo "//" >> $outfile
echo "#ifndef INLINE " >> $outfile
echo "#define INLINE " >> $outfile
echo "#endif" >> $outfile
echo "#ifndef _LL_GLOBAL_" >> $outfile
echo "#define _LL_GLOBAL_ " >> $outfile
echo "#endif" >> $outfile
echo "#ifndef _LL_SHARED_" >> $outfile
echo "#define _LL_SHARED_ " >> $outfile
echo "#endif" >> $outfile

# Edits:
#  i32 -> unsigned int
#  i64 -> unsigned long long int
#  @ f -> ""
#  addrspace(1) -> _LL_GLOBAL_
#  addrspace(3) -> _LL_SHARED_
#  define -> INLINE
#  { -> ;
#  #[0-9] -> ""
#  % -> ""
#  i8 -> unsigned char
#  i16  -> unsigned short int
#  i1 -> bool
#  local_unnamed_addr -> ""
#  FIXME: Add const where necessary
#  FIXME: convert nocapture to ???
#  FIXME: if define is not all on a single line
#  FIXME: Create data structure externs from globals.  Need to look at more than ll defines.
#  FIXME: convert readonly to ???  const ?

grep define $llfile | grep "{" | sed "s/define/INLINE/" | sed "s/i32/unsigned int/g" | sed "s/i64/unsigned long long int/g" | sed "s/%//g"  | sed "s/{/;/g" | sed "s/#[0-9]//g" | sed "s/addrspace(3)/_LL_SHARED_ /g" | sed "s/addrspace(1)/_LL_GLOBAL_ /g"  | sed "s/@//g" | sed "s/i8/unsigned char/g" |  sed "s/i16/unsigned short int/g" | sed "s/i1/bool/g" | sed "s/local_unnamed_addr//g" | sed "s/linkonce_odr//g" | sed "s/zeroext//g" | sed "/opencl.event/d" | sed "s/nocapture//g"   | sed "s/addrspace([4-5])//g" | sed "s/readonly//g" | sed "s/<[0-9]* x//g" | sed "s/>//g" | sed "s/[0-9] ;/;/g" | sed "s/signext//g" | sed "s/returned//g" | sed "s/hidden//g" | tee -a $outfile

# FIXME define ppu get_xxxx function
sed -i "/get_global_id/d" $outfile
sed -i "/get_global_size/d" $outfile
# FIXME ppu don't support half for now
sed -i "/half _/d" $outfile
sed -i "/half x/d" $outfile
sed -i "/half y/d" $outfile
sed -i "/half vec/d" $outfile


echo
echo outfile is $outfile
echo

cp $outfile $output_header
