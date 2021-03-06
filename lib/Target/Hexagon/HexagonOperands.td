//===- HexagonOperands.td - Hexagon immediate processing -*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illnois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

// Immediate operands.

let PrintMethod = "printImmOperand" in {
  // f32Ext type is used to identify constant extended floating point immediates.
  def f32Ext : Operand<f32>;
  def s32Imm : Operand<i32>;
  def s26_6Imm : Operand<i32>;
  def s16Imm : Operand<i32>;
  def s12Imm : Operand<i32>;
  def s11Imm : Operand<i32>;
  def s11_0Imm : Operand<i32>;
  def s11_1Imm : Operand<i32>;
  def s11_2Imm : Operand<i32>;
  def s11_3Imm : Operand<i32>;
  def s10Imm : Operand<i32>;
  def s9Imm : Operand<i32>;
  def m9Imm : Operand<i32>;
  def s8Imm : Operand<i32>;
  def s8Imm64 : Operand<i64>;
  def s6Imm : Operand<i32>;
  def s4Imm : Operand<i32>;
  def s4_0Imm : Operand<i32>;
  def s4_1Imm : Operand<i32>;
  def s4_2Imm : Operand<i32>;
  def s4_3Imm : Operand<i32>;
  def u64Imm : Operand<i64>;
  def u32Imm : Operand<i32>;
  def u26_6Imm : Operand<i32>;
  def u16Imm : Operand<i32>;
  def u16_0Imm : Operand<i32>;
  def u16_1Imm : Operand<i32>;
  def u16_2Imm : Operand<i32>;
  def u16_3Imm : Operand<i32>;
  def u11_3Imm : Operand<i32>;
  def u10Imm : Operand<i32>;
  def u9Imm : Operand<i32>;
  def u8Imm : Operand<i32>;
  def u7Imm : Operand<i32>;
  def u6Imm : Operand<i32>;
  def u6_0Imm : Operand<i32>;
  def u6_1Imm : Operand<i32>;
  def u6_2Imm : Operand<i32>;
  def u6_3Imm : Operand<i32>;
  def u5Imm : Operand<i32>;
  def u4Imm : Operand<i32>;
  def u3Imm : Operand<i32>;
  def u2Imm : Operand<i32>;
  def u1Imm : Operand<i32>;
  def n8Imm : Operand<i32>;
  def m6Imm : Operand<i32>;
}

let PrintMethod = "printNOneImmOperand" in
def nOneImm : Operand<i32>;

//
// Immediate predicates
//
def s32ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<32>(v);
}]>;

def s32_0ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<32>(v);
}]>;

def s31_1ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<31,1>(v);
}]>;

def s30_2ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<31,1>(v);
}]>;

def s29_3ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<31,1>(v);
}]>;

def s22_10ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<22,10>(v);
}]>;

def s8_24ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<8,24>(v);
}]>;

def s16_16ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<16,16>(v);
}]>;

def s26_6ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<26,6>(v);
}]>;

def s16ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<16>(v);
}]>;

def s13ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<13>(v);
}]>;

def s12ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<12>(v);
}]>;

def s11_0ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<11>(v);
}]>;

def s11_1ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<11,1>(v);
}]>;

def s11_2ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<11,2>(v);
}]>;

def s11_3ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<11,3>(v);
}]>;

def s10ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<10>(v);
}]>;

def s9ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<9>(v);
}]>;

def m9ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<9>(v) && (v != -256);
}]>;

def s8ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<8>(v);
}]>;

def s8Imm64Pred  : PatLeaf<(i64 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<8>(v);
}]>;

def s6ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<6>(v);
}]>;

def s4_0ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isInt<4>(v);
}]>;

def s4_1ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<4,1>(v);
}]>;

def s4_2ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<4,2>(v);
}]>;

def s4_3ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedInt<4,3>(v);
}]>;


def u64ImmPred  : PatLeaf<(i64 imm), [{
  // Adding "N ||" to suppress gcc unused warning.
  return (N || true);
}]>;

def u32ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<32>(v);
}]>;

def u32_0ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<32>(v);
}]>;

def u31_1ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<31,1>(v);
}]>;

def u30_2ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<30,2>(v);
}]>;

def u29_3ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<29,3>(v);
}]>;

def u26_6ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<26,6>(v);
}]>;

def u16ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<16>(v);
}]>;

def u16_s8ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<16,8>(v);
}]>;

def u16_0ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<16>(v);
}]>;

def u11_3ImmPred : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<11,3>(v);
}]>;

def u9ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<9>(v);
}]>;

def u8ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<8>(v);
}]>;

def u7StrictPosImmPred : ImmLeaf<i32, [{
  // u7StrictPosImmPred predicate - True if the immediate fits in an 7-bit
  // unsigned field and is strictly greater than 0.
  return isUInt<7>(Imm) && Imm > 0;
}]>;

def u7ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<7>(v);
}]>;

def u6ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<6>(v);
}]>;

def u6_0ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<6>(v);
}]>;

def u6_1ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<6,1>(v);
}]>;

def u6_2ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<6,2>(v);
}]>;

def u6_3ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isShiftedUInt<6,3>(v);
}]>;

def u5ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<5>(v);
}]>;

def u4ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<4>(v);
}]>;

def u3ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<3>(v);
}]>;

def u2ImmPred  : PatLeaf<(i32 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<2>(v);
}]>;

def u1ImmPred  : PatLeaf<(i1 imm), [{
  int64_t v = (int64_t)N->getSExtValue();
  return isUInt<1>(v);
}]>;

def m5BImmPred  : PatLeaf<(i32 imm), [{
  // m5BImmPred predicate - True if the (char) number is in range -1 .. -31
  // and will fit in a 5 bit field when made positive, for use in memops.
  // this is specific to the zero extending of a negative by CombineInstr
  int8_t v = (int8_t)N->getSExtValue();
  return (-31 <= v && v <= -1);
}]>;

def m5HImmPred  : PatLeaf<(i32 imm), [{
  // m5HImmPred predicate - True if the (short) number is in range -1 .. -31
  // and will fit in a 5 bit field when made positive, for use in memops.
  // this is specific to the zero extending of a negative by CombineInstr
  int16_t v = (int16_t)N->getSExtValue();
  return (-31 <= v && v <= -1);
}]>;

def m5ImmPred  : PatLeaf<(i32 imm), [{
  // m5ImmPred predicate - True if the number is in range -1 .. -31
  // and will fit in a 5 bit field when made positive, for use in memops.
  int64_t v = (int64_t)N->getSExtValue();
  return (-31 <= v && v <= -1);
}]>;

//InN means negative integers in [-(2^N - 1), 0]
def n8ImmPred  : PatLeaf<(i32 imm), [{
  // n8ImmPred predicate - True if the immediate fits in a 8-bit signed
  // field.
  int64_t v = (int64_t)N->getSExtValue();
  return (-255 <= v && v <= 0);
}]>;

def nOneImmPred  : PatLeaf<(i32 imm), [{
  // nOneImmPred predicate - True if the immediate is -1.
  int64_t v = (int64_t)N->getSExtValue();
  return (-1 == v);
}]>;

def Set5ImmPred : PatLeaf<(i32 imm), [{
  // Set5ImmPred predicate - True if the number is in the series of values.
  // [ 2^0, 2^1, ... 2^31 ]
  // For use in setbit immediate.
  uint32_t v = (int32_t)N->getSExtValue();
  // Constrain to 32 bits, and then check for single bit.
  return ImmIsSingleBit(v);
}]>;

def Clr5ImmPred : PatLeaf<(i32 imm), [{
  // Clr5ImmPred predicate - True if the number is in the series of
  // bit negated values.
  // [ 2^0, 2^1, ... 2^31 ]
  // For use in clrbit immediate.
  // Note: we are bit NOTing the value.
  uint32_t v = ~ (int32_t)N->getSExtValue();
  // Constrain to 32 bits, and then check for single bit.
  return ImmIsSingleBit(v);
}]>;

def SetClr5ImmPred : PatLeaf<(i32 imm), [{
  // SetClr5ImmPred predicate - True if the immediate is in range 0..31.
  int32_t v = (int32_t)N->getSExtValue();
  return (v >= 0 && v <= 31);
}]>;

def Set4ImmPred : PatLeaf<(i32 imm), [{
  // Set4ImmPred predicate - True if the number is in the series of values:
  // [ 2^0, 2^1, ... 2^15 ].
  // For use in setbit immediate.
  uint16_t v = (int16_t)N->getSExtValue();
  // Constrain to 16 bits, and then check for single bit.
  return ImmIsSingleBit(v);
}]>;

def Clr4ImmPred : PatLeaf<(i32 imm), [{
  // Clr4ImmPred predicate - True if the number is in the series of
  // bit negated values:
  // [ 2^0, 2^1, ... 2^15 ].
  // For use in setbit and clrbit immediate.
  uint16_t v = ~ (int16_t)N->getSExtValue();
  // Constrain to 16 bits, and then check for single bit.
  return ImmIsSingleBit(v);
}]>;

def SetClr4ImmPred : PatLeaf<(i32 imm), [{
  // SetClr4ImmPred predicate - True if the immediate is in the range 0..15.
  int16_t v = (int16_t)N->getSExtValue();
  return (v >= 0 && v <= 15);
}]>;

def Set3ImmPred : PatLeaf<(i32 imm), [{
  // Set3ImmPred predicate - True if the number is in the series of values:
  // [ 2^0, 2^1, ... 2^7 ].
  // For use in setbit immediate.
  uint8_t v = (int8_t)N->getSExtValue();
  // Constrain to 8 bits, and then check for single bit.
  return ImmIsSingleBit(v);
}]>;

def Clr3ImmPred : PatLeaf<(i32 imm), [{
  // Clr3ImmPred predicate - True if the number is in the series of
  // bit negated values:
  // [ 2^0, 2^1, ... 2^7 ].
  // For use in setbit and clrbit immediate.
  uint8_t v = ~ (int8_t)N->getSExtValue();
  // Constrain to 8 bits, and then check for single bit.
  return ImmIsSingleBit(v);
}]>;

def SetClr3ImmPred : PatLeaf<(i32 imm), [{
  // SetClr3ImmPred predicate - True if the immediate is in the range  0..7.
  int8_t v = (int8_t)N->getSExtValue();
  return (v >= 0 && v <= 7);
}]>;


// Extendable immediate operands.

let PrintMethod = "printExtOperand" in {
  def s16Ext : Operand<i32>;
  def s12Ext : Operand<i32>;
  def s10Ext : Operand<i32>;
  def s9Ext : Operand<i32>;
  def s8Ext : Operand<i32>;
  def s6Ext : Operand<i32>;
  def s11_0Ext : Operand<i32>;
  def s11_1Ext : Operand<i32>;
  def s11_2Ext : Operand<i32>;
  def s11_3Ext : Operand<i32>;
  def u6Ext : Operand<i32>;
  def u7Ext : Operand<i32>;
  def u8Ext : Operand<i32>;
  def u9Ext : Operand<i32>;
  def u10Ext : Operand<i32>;
  def u6_0Ext : Operand<i32>;
  def u6_1Ext : Operand<i32>;
  def u6_2Ext : Operand<i32>;
  def u6_3Ext : Operand<i32>;
}


// This complex pattern exists only to create a machine instruction operand
// of type "frame index". There doesn't seem to be a way to do that directly
// in the patterns.
def AddrFI : ComplexPattern<i32, 1, "SelectAddrFI", [frameindex], []>;

// These complex patterns are not strictly necessary, since global address
// folding will happen during DAG combining. For distinguishing between GA
// and GP, pat frags with HexagonCONST32 and HexagonCONST32_GP can be used.
def AddrGA : ComplexPattern<i32, 1, "SelectAddrGA", [], []>;
def AddrGP : ComplexPattern<i32, 1, "SelectAddrGP", [], []>;

// Address operands.

let PrintMethod = "printGlobalOperand" in {
  def globaladdress : Operand<i32>;
  def globaladdressExt : Operand<i32>;
}

let PrintMethod = "printJumpTable" in
def jumptablebase : Operand<i32>;

def brtarget : Operand<OtherVT>;
def brtargetExt : Operand<OtherVT>;
def calltarget : Operand<i32>;

def bblabel : Operand<i32>;
def bbl   : SDNode<"ISD::BasicBlock", SDTPtrLeaf   , [], "BasicBlockSDNode">;

def symbolHi32 : Operand<i32> {
  let PrintMethod = "printSymbolHi";
}
def symbolLo32 : Operand<i32> {
  let PrintMethod = "printSymbolLo";
}

// Return true if for a 32 to 64-bit sign-extended load.
def is_sext_i32 : PatLeaf<(i64 DoubleRegs:$src1), [{
  LoadSDNode *LD = dyn_cast<LoadSDNode>(N);
  if (!LD)
    return false;
  return LD->getExtensionType() == ISD::SEXTLOAD &&
         LD->getMemoryVT().getScalarType() == MVT::i32;
}]>;
