; RUN: llc -O0 -fast-isel=false < %s | FileCheck %s
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-apple-macosx10.6.7"
;Radar 9321650

;CHECK: ##DEBUG_VALUE: my_a 

%class.A = type { i32, i32, i32, i32 }

define void @_Z3fooi(%class.A* sret %agg.result, i32 %i) ssp {
entry:
  %i.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %nrvo = alloca i1
  %cleanup.dest.slot = alloca i32
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !26, metadata !MDExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %j, metadata !28, metadata !MDExpression()), !dbg !30
  store i32 0, i32* %j, align 4, !dbg !31
  %tmp = load i32, i32* %i.addr, align 4, !dbg !32
  %cmp = icmp eq i32 %tmp, 42, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %tmp1 = load i32, i32* %i.addr, align 4, !dbg !33
  %add = add nsw i32 %tmp1, 1, !dbg !33
  store i32 %add, i32* %j, align 4, !dbg !33
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  store i1 false, i1* %nrvo, !dbg !36
  call void @llvm.dbg.declare(metadata %class.A* %agg.result, metadata !37, metadata !MDExpression()), !dbg !39
  %tmp2 = load i32, i32* %j, align 4, !dbg !40
  %x = getelementptr inbounds %class.A, %class.A* %agg.result, i32 0, i32 0, !dbg !40
  store i32 %tmp2, i32* %x, align 4, !dbg !40
  store i1 true, i1* %nrvo, !dbg !41
  store i32 1, i32* %cleanup.dest.slot
  %nrvo.val = load i1, i1* %nrvo, !dbg !42
  br i1 %nrvo.val, label %nrvo.skipdtor, label %nrvo.unused, !dbg !42

nrvo.unused:                                      ; preds = %if.end
  call void @_ZN1AD1Ev(%class.A* %agg.result), !dbg !42
  br label %nrvo.skipdtor, !dbg !42

nrvo.skipdtor:                                    ; preds = %nrvo.unused, %if.end
  ret void, !dbg !42
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) nounwind readnone

define linkonce_odr void @_ZN1AD1Ev(%class.A* %this) unnamed_addr ssp align 2 {
entry:
  %this.addr = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.A** %this.addr, metadata !43, metadata !MDExpression()), !dbg !44
  %this1 = load %class.A*, %class.A** %this.addr
  call void @_ZN1AD2Ev(%class.A* %this1)
  ret void, !dbg !45
}

define linkonce_odr void @_ZN1AD2Ev(%class.A* %this) unnamed_addr nounwind ssp align 2 {
entry:
  %this.addr = alloca %class.A*, align 8
  store %class.A* %this, %class.A** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.A** %this.addr, metadata !46, metadata !MDExpression()), !dbg !47
  %this1 = load %class.A*, %class.A** %this.addr
  %x = getelementptr inbounds %class.A, %class.A* %this1, i32 0, i32 0, !dbg !48
  store i32 1, i32* %x, align 4, !dbg !48
  ret void, !dbg !48
}

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!52}

!0 = !MDSubprogram(name: "~A", line: 2, isLocal: false, isDefinition: false, virtualIndex: 6, flags: DIFlagPrototyped, isOptimized: false, file: !51, scope: !1, type: !11)
!1 = !MDCompositeType(tag: DW_TAG_class_type, name: "A", line: 2, size: 128, align: 32, file: !51, scope: !2, elements: !4)
!2 = !MDCompileUnit(language: DW_LANG_C_plus_plus, producer: "clang version 3.0 (trunk 130127)", isOptimized: false, emissionKind: 1, file: !51, enums: !24, retainedTypes: !24, subprograms: !50)
!3 = !MDFile(filename: "a.cc", directory: "/private/tmp")
!4 = !{!5, !7, !8, !9, !0, !10, !14}
!5 = !MDDerivedType(tag: DW_TAG_member, name: "x", line: 2, size: 32, align: 32, file: !51, scope: !3, baseType: !6)
!6 = !MDBasicType(tag: DW_TAG_base_type, name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !MDDerivedType(tag: DW_TAG_member, name: "y", line: 2, size: 32, align: 32, offset: 32, file: !51, scope: !3, baseType: !6)
!8 = !MDDerivedType(tag: DW_TAG_member, name: "z", line: 2, size: 32, align: 32, offset: 64, file: !51, scope: !3, baseType: !6)
!9 = !MDDerivedType(tag: DW_TAG_member, name: "o", line: 2, size: 32, align: 32, offset: 96, file: !51, scope: !3, baseType: !6)
!10 = !MDSubprogram(name: "A", line: 2, isLocal: false, isDefinition: false, virtualIndex: 6, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, file: !51, scope: !1, type: !11)
!11 = !MDSubroutineType(types: !12)
!12 = !{null, !13}
!13 = !MDDerivedType(tag: DW_TAG_pointer_type, size: 64, align: 64, flags: DIFlagArtificial, file: !2, baseType: !1)
!14 = !MDSubprogram(name: "A", line: 2, isLocal: false, isDefinition: false, virtualIndex: 6, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, file: !51, scope: !1, type: !15)
!15 = !MDSubroutineType(types: !16)
!16 = !{null, !13, !17}
!17 = !MDDerivedType(tag: DW_TAG_reference_type, scope: !2, baseType: !18)
!18 = !MDDerivedType(tag: DW_TAG_const_type, file: !2, baseType: !1)
!19 = !MDSubprogram(name: "foo", linkageName: "_Z3fooi", line: 4, isLocal: false, isDefinition: true, virtualIndex: 6, flags: DIFlagPrototyped, isOptimized: false, file: !51, scope: !3, type: !20, function: void (%class.A*, i32)* @_Z3fooi)
!20 = !MDSubroutineType(types: !21)
!21 = !{!1}
!22 = !MDSubprogram(name: "~A", linkageName: "_ZN1AD1Ev", line: 2, isLocal: false, isDefinition: true, virtualIndex: 6, flags: DIFlagPrototyped, isOptimized: false, file: !51, scope: !3, type: !23, function: void (%class.A*)* @_ZN1AD1Ev)
!23 = !MDSubroutineType(types: !24)
!24 = !{null}
!25 = !MDSubprogram(name: "~A", linkageName: "_ZN1AD2Ev", line: 2, isLocal: false, isDefinition: true, virtualIndex: 6, flags: DIFlagPrototyped, isOptimized: false, file: !51, scope: !3, type: !23, function: void (%class.A*)* @_ZN1AD2Ev)
!26 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "i", line: 4, arg: 1, scope: !19, file: !3, type: !6)
!27 = !MDLocation(line: 4, column: 11, scope: !19)
!28 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "j", line: 5, scope: !29, file: !3, type: !6)
!29 = distinct !MDLexicalBlock(line: 4, column: 14, file: !51, scope: !19)
!30 = !MDLocation(line: 5, column: 7, scope: !29)
!31 = !MDLocation(line: 5, column: 12, scope: !29)
!32 = !MDLocation(line: 6, column: 3, scope: !29)
!33 = !MDLocation(line: 7, column: 5, scope: !34)
!34 = distinct !MDLexicalBlock(line: 6, column: 16, file: !51, scope: !29)
!35 = !MDLocation(line: 8, column: 3, scope: !34)
!36 = !MDLocation(line: 9, column: 9, scope: !29)
!37 = !MDLocalVariable(tag: DW_TAG_auto_variable, name: "my_a", line: 9, scope: !29, file: !3, type: !38)
!38 = !MDDerivedType(tag: DW_TAG_reference_type, file: !2, baseType: !1)
!39 = !MDLocation(line: 9, column: 5, scope: !29)
!40 = !MDLocation(line: 10, column: 3, scope: !29)
!41 = !MDLocation(line: 11, column: 3, scope: !29)
!42 = !MDLocation(line: 12, column: 1, scope: !29)
!43 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "this", line: 2, arg: 1, flags: DIFlagArtificial, scope: !22, file: !3, type: !13)
!44 = !MDLocation(line: 2, column: 47, scope: !22)
!45 = !MDLocation(line: 2, column: 61, scope: !22)
!46 = !MDLocalVariable(tag: DW_TAG_arg_variable, name: "this", line: 2, arg: 1, flags: DIFlagArtificial, scope: !25, file: !3, type: !13)
!47 = !MDLocation(line: 2, column: 47, scope: !25)
!48 = !MDLocation(line: 2, column: 54, scope: !49)
!49 = distinct !MDLexicalBlock(line: 2, column: 52, file: !51, scope: !25)
!50 = !{!19, !22, !25}
!51 = !MDFile(filename: "a.cc", directory: "/private/tmp")
!52 = !{i32 1, !"Debug Info Version", i32 3}
