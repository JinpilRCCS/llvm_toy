; NOTE: Assertions have been autogenerated by update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

define i32 @foo(i32 %x, i32 %y) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[A:%.*]] = and i32 %x, 7
; CHECK-NEXT:    [[B:%.*]] = and i32 %y, 7
; CHECK-NEXT:    [[C:%.*]] = mul nuw nsw i32 [[A]], [[B]]
; CHECK-NEXT:    [[D:%.*]] = shl nuw i32 [[C]], 26
; CHECK-NEXT:    [[E:%.*]] = ashr exact i32 [[D]], 26
; CHECK-NEXT:    ret i32 [[E]]
;
  %a = and i32 %x, 7
  %b = and i32 %y, 7
  %c = mul i32 %a, %b
  %d = shl i32 %c, 26
  %e = ashr i32 %d, 26
  ret i32 %e
}
