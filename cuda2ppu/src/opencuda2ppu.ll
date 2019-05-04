; ModuleID = './cuda2ppu/src/attic/opencuda2ppu.cl'
source_filename = "./cuda2ppu/src/attic/opencuda2ppu.cl"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5"
target triple = "amdgcn-amd-amdhsa"

@g_global_memory = hidden local_unnamed_addr addrspace(1) global i32 addrspace(1)* null, align 8

; Function Attrs: norecurse nounwind writeonly
define weak_odr hidden void @init_global_memory(i32 addrspace(1)* %in) local_unnamed_addr #0 {
entry:
  store i32 addrspace(1)* %in, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  ret void
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @read_register(i32 %reg_id) local_unnamed_addr #1 {
entry:
  %cmp = icmp sgt i32 %reg_id, 21
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %idxprom = sext i32 %reg_id to i64
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %idxprom
  %1 = load i32, i32 addrspace(1)* %arrayidx, align 4, !tbaa !8
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ %1, %if.end ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @get_global_id(i32 %a) local_unnamed_addr #1 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %1 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.x() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 5
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.y() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 6
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.z() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 7
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.w() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 8
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.x() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 9
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.y() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 10
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.z() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 11
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.w() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 12
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.x() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 13
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.y() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 14
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.z() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 15
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.w() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 16
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.x() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 17
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.y() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 18
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.z() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 19
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.w() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 20
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.warpsize() local_unnamed_addr #2 {
entry:
  %0 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @g_global_memory, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 21
  %1 = load i32, i32 addrspace(1)* %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

attributes #0 = { norecurse nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 8.0.0 (git@192.168.100.10:sw/open_source/clang.git 230c820eae288121f635f6de37cb5656cd665ef6) (git@192.168.100.10:sw/open_source/llvm.git f77fbe7d3fc87c3a8c8803b996bd536a14661c35)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
