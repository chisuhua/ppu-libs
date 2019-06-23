; ModuleID = './cuda2ppu/src/attic/opencuda2ppu.cl'
source_filename = "./cuda2ppu/src/attic/opencuda2ppu.cl"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5"
target triple = "amdgcn-amd-amdhsa"

%struct.aco_ctx = type { %struct.aco_ctx*, i8* }

; Function Attrs: convergent nounwind
define hidden i32 @read_register(i32 %reg_id) local_unnamed_addr #0 {
entry:
  %call = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 %reg_id) #3
  ret i32 %call
}

; Function Attrs: convergent
declare i32 @__builtin_read_register(%struct.aco_ctx*, i32) local_unnamed_addr #1

; Function Attrs: convergent nounwind
define hidden i32 @get_global_id(i32 %a) local_unnamed_addr #0 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 0) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.x() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 5) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.y() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 6) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.z() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 7) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.tid.w() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 8) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.x() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 9) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.y() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 10) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.z() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 11) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ntid.w() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 12) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.x() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 13) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.y() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 14) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.z() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 15) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.ctaid.w() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 16) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.x() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 17) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.y() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 18) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.z() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 19) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.nctaid.w() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 20) #3
  ret i32 %call.i
}

; Function Attrs: convergent nounwind readnone
define hidden i32 @nvvm.read.ptx.sreg.warpsize() local_unnamed_addr #2 {
entry:
  %call.i = tail call i32 @__builtin_read_register(%struct.aco_ctx* undef, i32 21) #3
  ret i32 %call.i
}

attributes #0 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 9.0.0 (git@github.com:chisuhua/clang.git 4d05ed20d21e3e1caa3e531d73d6afd0b5c990fb) (git@github.com:chisuhua/llvm.git ea8c92cb12ed37bea717c82bf7eebf7eec1b01bd)"}
