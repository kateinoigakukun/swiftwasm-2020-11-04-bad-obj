// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 1)
//===--- TgmathDerivatives.swift.gyb --------------------------*- swift -*-===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
// This file defines derivatives for tgmath functions.
//===----------------------------------------------------------------------===//

import Swift

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
  import Darwin.C.tgmath
#elseif os(Linux) || os(FreeBSD) || os(OpenBSD) || os(PS4) || os(Android) || os(Cygwin) || os(Haiku)
  import Glibc
#elseif os(WASI)
  import WASILibc
#elseif os(Windows)
  import CRT
#else
#error("Unsupported platform")
#endif

@usableFromInline
@derivative(of: fma)
func _jvpFma<T: FloatingPoint & Differentiable> (
  _ x: T,
  _ y: T,
  _ z: T
) -> (value: T, differential: (T, T, T) -> T) where T == T.TangentVector {
  return (fma(x, y, z), { (dx, dy, dz) in dx * y + dy * x + dz })
}

@usableFromInline
@derivative(of: fma)
func _vjpFma<T: FloatingPoint & Differentiable> (
  _ x: T,
  _ y: T,
  _ z: T
) -> (value: T, pullback: (T) -> (T, T, T)) where T == T.TangentVector {
  return (fma(x, y, z), { v in (v * y, v * x, v) })
}

@usableFromInline
@derivative(of: remainder)
func _jvpRemainder<T: FloatingPoint & Differentiable> (
  _ x: T,
  _ y: T
) -> (value: T, differential: (T, T) -> T) where T == T.TangentVector {
  fatalError("""
    Unimplemented JVP for 'remainder(_:)'. \
    https://bugs.swift.org/browse/TF-1108 tracks this issue
    """)
}

@usableFromInline
@derivative(of: remainder)
func _vjpRemainder<T: FloatingPoint & Differentiable> (
  _ x: T,
  _ y: T
) -> (value: T, pullback: (T) -> (T, T)) where T == T.TangentVector {
  return (remainder(x, y), { v in (v, -v * ((x / y).rounded(.toNearestOrEven))) })
}

@usableFromInline
@derivative(of: fmod)
func _jvpFmod<T: FloatingPoint & Differentiable> (
  _ x: T,
  _ y: T
) -> (value: T, differential: (T, T) -> T) where T == T.TangentVector {
  fatalError("""
    Unimplemented JVP for 'fmod(_:)'. \
    https://bugs.swift.org/browse/TF-1108 tracks this issue
    """)
}

@usableFromInline
@derivative(of: fmod)
func _vjpFmod<T: FloatingPoint & Differentiable> (
  _ x: T,
  _ y: T
) -> (value: T, pullback: (T) -> (T, T)) where T == T.TangentVector {
  return (fmod(x, y), { v in (v, -v * ((x / y).rounded(.towardZero))) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 93)
@usableFromInline
@derivative(of: sqrt)
func _jvpSqrt<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, differential: (T) -> T) where T == T.TangentVector {
  let value = sqrt(x)
  return (value, { v in v / (2 * value) })
}

@usableFromInline
@derivative(of: ceil)
func _jvpCeil<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, differential: (T) -> T) where T == T.TangentVector {
  return (ceil(x), { v in 0 })
}

@usableFromInline
@derivative(of: floor)
func _jvpFloor<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, differential: (T) -> T) where T == T.TangentVector {
  return (floor(x), { v in 0 })
}

@usableFromInline
@derivative(of: round)
func _jvpRound<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, differential: (T) -> T) where T == T.TangentVector {
  return (round(x), { v in 0 })
}

@usableFromInline
@derivative(of: trunc)
func _jvpTrunc<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, differential: (T) -> T) where T == T.TangentVector {
  return (trunc(x), { v in 0 })
}
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 93)
@usableFromInline
@derivative(of: sqrt)
func _vjpSqrt<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, pullback: (T) -> T) where T == T.TangentVector {
  let value = sqrt(x)
  return (value, { v in v / (2 * value) })
}

@usableFromInline
@derivative(of: ceil)
func _vjpCeil<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, pullback: (T) -> T) where T == T.TangentVector {
  return (ceil(x), { v in 0 })
}

@usableFromInline
@derivative(of: floor)
func _vjpFloor<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, pullback: (T) -> T) where T == T.TangentVector {
  return (floor(x), { v in 0 })
}

@usableFromInline
@derivative(of: round)
func _vjpRound<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, pullback: (T) -> T) where T == T.TangentVector {
  return (round(x), { v in 0 })
}

@usableFromInline
@derivative(of: trunc)
func _vjpTrunc<T: FloatingPoint & Differentiable> (
  _ x: T
) -> (value: T, pullback: (T) -> T) where T == T.TangentVector {
  return (trunc(x), { v in 0 })
}
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 134)

// Unary functions
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 142)
@inlinable
@derivative(of: exp)
func _jvpExp(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  let value = exp(x)
  return (value, { v in value * v })
}

@inlinable
@derivative(of: exp2)
func _jvpExp2(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  let value = exp2(x)
  return (value, { v in v * Float(M_LN2) * value })
}

@inlinable
@derivative(of: log)
func _jvpLog(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (log(x), { v in v / x })
}

@inlinable
@derivative(of: log10)
func _jvpLog10(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (log10(x), { v in v * Float(M_LOG10E) / x })
}

@inlinable
@derivative(of: log2)
func _jvpLog2(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (log2(x), { v in v / (Float(M_LN2) * x) })
}

@inlinable
@derivative(of: sin)
func _jvpSin(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (sin(x), { v in v * cos(x) })
}

@inlinable
@derivative(of: cos)
func _jvpCos(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (cos(x), { v in -v * sin(x) })
}

@inlinable
@derivative(of: tan)
func _jvpTan(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  let value = tan(x)
  return (value, { v in v * (1 + value * value) })
}

@inlinable
@derivative(of: asin)
func _jvpAsin(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (asin(x), { v in v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: acos)
func _jvpAcos(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (acos(x), { v in -v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: atan)
func _jvpAtan(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (atan(x), { v in v / (1 + x * x) })
}

@inlinable
@derivative(of: sinh)
func _jvpSinh(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (sinh(x), { v in v * cosh(x) })
}

@inlinable
@derivative(of: cosh)
func _jvpCosh(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (cosh(x), { v in v * sinh(x) })
}

@inlinable
@derivative(of: tanh)
func _jvpTanh(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  let value = tanh(x)
  return (value, { v in v * (1 - value * value) })
}

@inlinable
@derivative(of: asinh)
func _jvpAsinh(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (asinh(x), { v in v / sqrt(1 + x * x) })
}

@inlinable
@derivative(of: acosh)
func _jvpAcosh(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (acosh(x), { v in v / sqrt(x * x - 1) })
}

@inlinable
@derivative(of: atanh)
func _jvpAtanh(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (atanh(x), { v in v / (1 - x * x) })
}

@inlinable
@derivative(of: expm1)
func _jvpExpm1(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (expm1(x), { v in exp(x) * v })
}

@inlinable
@derivative(of: log1p)
func _jvpLog1p(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (log1p(x), { v in v / (x + 1) })
}

@inlinable
@derivative(of: erf)
func _jvpErf(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (erf(x), { v in v * Float(M_2_SQRTPI) * exp(-x * x) })
}

@inlinable
@derivative(of: erfc)
func _jvpErfc(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
  return (erfc(x), { v in v * -Float(M_2_SQRTPI) * exp(-x * x) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 142)
@inlinable
@derivative(of: exp)
func _jvpExp(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  let value = exp(x)
  return (value, { v in value * v })
}

@inlinable
@derivative(of: exp2)
func _jvpExp2(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  let value = exp2(x)
  return (value, { v in v * Double(M_LN2) * value })
}

@inlinable
@derivative(of: log)
func _jvpLog(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (log(x), { v in v / x })
}

@inlinable
@derivative(of: log10)
func _jvpLog10(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (log10(x), { v in v * Double(M_LOG10E) / x })
}

@inlinable
@derivative(of: log2)
func _jvpLog2(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (log2(x), { v in v / (Double(M_LN2) * x) })
}

@inlinable
@derivative(of: sin)
func _jvpSin(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (sin(x), { v in v * cos(x) })
}

@inlinable
@derivative(of: cos)
func _jvpCos(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (cos(x), { v in -v * sin(x) })
}

@inlinable
@derivative(of: tan)
func _jvpTan(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  let value = tan(x)
  return (value, { v in v * (1 + value * value) })
}

@inlinable
@derivative(of: asin)
func _jvpAsin(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (asin(x), { v in v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: acos)
func _jvpAcos(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (acos(x), { v in -v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: atan)
func _jvpAtan(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (atan(x), { v in v / (1 + x * x) })
}

@inlinable
@derivative(of: sinh)
func _jvpSinh(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (sinh(x), { v in v * cosh(x) })
}

@inlinable
@derivative(of: cosh)
func _jvpCosh(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (cosh(x), { v in v * sinh(x) })
}

@inlinable
@derivative(of: tanh)
func _jvpTanh(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  let value = tanh(x)
  return (value, { v in v * (1 - value * value) })
}

@inlinable
@derivative(of: asinh)
func _jvpAsinh(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (asinh(x), { v in v / sqrt(1 + x * x) })
}

@inlinable
@derivative(of: acosh)
func _jvpAcosh(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (acosh(x), { v in v / sqrt(x * x - 1) })
}

@inlinable
@derivative(of: atanh)
func _jvpAtanh(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (atanh(x), { v in v / (1 - x * x) })
}

@inlinable
@derivative(of: expm1)
func _jvpExpm1(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (expm1(x), { v in exp(x) * v })
}

@inlinable
@derivative(of: log1p)
func _jvpLog1p(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (log1p(x), { v in v / (x + 1) })
}

@inlinable
@derivative(of: erf)
func _jvpErf(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (erf(x), { v in v * Double(M_2_SQRTPI) * exp(-x * x) })
}

@inlinable
@derivative(of: erfc)
func _jvpErfc(_ x: Double) -> (value: Double, differential: (Double) -> Double) {
  return (erfc(x), { v in v * -Double(M_2_SQRTPI) * exp(-x * x) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 140)
#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 142)
@inlinable
@derivative(of: exp)
func _jvpExp(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  let value = exp(x)
  return (value, { v in value * v })
}

@inlinable
@derivative(of: exp2)
func _jvpExp2(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  let value = exp2(x)
  return (value, { v in v * Float80(M_LN2) * value })
}

@inlinable
@derivative(of: log)
func _jvpLog(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (log(x), { v in v / x })
}

@inlinable
@derivative(of: log10)
func _jvpLog10(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (log10(x), { v in v * Float80(M_LOG10E) / x })
}

@inlinable
@derivative(of: log2)
func _jvpLog2(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (log2(x), { v in v / (Float80(M_LN2) * x) })
}

@inlinable
@derivative(of: sin)
func _jvpSin(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (sin(x), { v in v * cos(x) })
}

@inlinable
@derivative(of: cos)
func _jvpCos(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (cos(x), { v in -v * sin(x) })
}

@inlinable
@derivative(of: tan)
func _jvpTan(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  let value = tan(x)
  return (value, { v in v * (1 + value * value) })
}

@inlinable
@derivative(of: asin)
func _jvpAsin(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (asin(x), { v in v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: acos)
func _jvpAcos(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (acos(x), { v in -v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: atan)
func _jvpAtan(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (atan(x), { v in v / (1 + x * x) })
}

@inlinable
@derivative(of: sinh)
func _jvpSinh(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (sinh(x), { v in v * cosh(x) })
}

@inlinable
@derivative(of: cosh)
func _jvpCosh(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (cosh(x), { v in v * sinh(x) })
}

@inlinable
@derivative(of: tanh)
func _jvpTanh(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  let value = tanh(x)
  return (value, { v in v * (1 - value * value) })
}

@inlinable
@derivative(of: asinh)
func _jvpAsinh(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (asinh(x), { v in v / sqrt(1 + x * x) })
}

@inlinable
@derivative(of: acosh)
func _jvpAcosh(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (acosh(x), { v in v / sqrt(x * x - 1) })
}

@inlinable
@derivative(of: atanh)
func _jvpAtanh(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (atanh(x), { v in v / (1 - x * x) })
}

@inlinable
@derivative(of: expm1)
func _jvpExpm1(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (expm1(x), { v in exp(x) * v })
}

@inlinable
@derivative(of: log1p)
func _jvpLog1p(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (log1p(x), { v in v / (x + 1) })
}

@inlinable
@derivative(of: erf)
func _jvpErf(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (erf(x), { v in v * Float80(M_2_SQRTPI) * exp(-x * x) })
}

@inlinable
@derivative(of: erfc)
func _jvpErfc(_ x: Float80) -> (value: Float80, differential: (Float80) -> Float80) {
  return (erfc(x), { v in v * -Float80(M_2_SQRTPI) * exp(-x * x) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 273)
#endif
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 142)
@inlinable
@derivative(of: exp)
func _vjpExp(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  let value = exp(x)
  return (value, { v in value * v })
}

@inlinable
@derivative(of: exp2)
func _vjpExp2(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  let value = exp2(x)
  return (value, { v in v * Float(M_LN2) * value })
}

@inlinable
@derivative(of: log)
func _vjpLog(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (log(x), { v in v / x })
}

@inlinable
@derivative(of: log10)
func _vjpLog10(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (log10(x), { v in v * Float(M_LOG10E) / x })
}

@inlinable
@derivative(of: log2)
func _vjpLog2(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (log2(x), { v in v / (Float(M_LN2) * x) })
}

@inlinable
@derivative(of: sin)
func _vjpSin(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (sin(x), { v in v * cos(x) })
}

@inlinable
@derivative(of: cos)
func _vjpCos(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (cos(x), { v in -v * sin(x) })
}

@inlinable
@derivative(of: tan)
func _vjpTan(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  let value = tan(x)
  return (value, { v in v * (1 + value * value) })
}

@inlinable
@derivative(of: asin)
func _vjpAsin(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (asin(x), { v in v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: acos)
func _vjpAcos(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (acos(x), { v in -v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: atan)
func _vjpAtan(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (atan(x), { v in v / (1 + x * x) })
}

@inlinable
@derivative(of: sinh)
func _vjpSinh(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (sinh(x), { v in v * cosh(x) })
}

@inlinable
@derivative(of: cosh)
func _vjpCosh(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (cosh(x), { v in v * sinh(x) })
}

@inlinable
@derivative(of: tanh)
func _vjpTanh(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  let value = tanh(x)
  return (value, { v in v * (1 - value * value) })
}

@inlinable
@derivative(of: asinh)
func _vjpAsinh(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (asinh(x), { v in v / sqrt(1 + x * x) })
}

@inlinable
@derivative(of: acosh)
func _vjpAcosh(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (acosh(x), { v in v / sqrt(x * x - 1) })
}

@inlinable
@derivative(of: atanh)
func _vjpAtanh(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (atanh(x), { v in v / (1 - x * x) })
}

@inlinable
@derivative(of: expm1)
func _vjpExpm1(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (expm1(x), { v in exp(x) * v })
}

@inlinable
@derivative(of: log1p)
func _vjpLog1p(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (log1p(x), { v in v / (x + 1) })
}

@inlinable
@derivative(of: erf)
func _vjpErf(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (erf(x), { v in v * Float(M_2_SQRTPI) * exp(-x * x) })
}

@inlinable
@derivative(of: erfc)
func _vjpErfc(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  return (erfc(x), { v in v * -Float(M_2_SQRTPI) * exp(-x * x) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 142)
@inlinable
@derivative(of: exp)
func _vjpExp(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  let value = exp(x)
  return (value, { v in value * v })
}

@inlinable
@derivative(of: exp2)
func _vjpExp2(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  let value = exp2(x)
  return (value, { v in v * Double(M_LN2) * value })
}

@inlinable
@derivative(of: log)
func _vjpLog(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (log(x), { v in v / x })
}

@inlinable
@derivative(of: log10)
func _vjpLog10(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (log10(x), { v in v * Double(M_LOG10E) / x })
}

@inlinable
@derivative(of: log2)
func _vjpLog2(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (log2(x), { v in v / (Double(M_LN2) * x) })
}

@inlinable
@derivative(of: sin)
func _vjpSin(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (sin(x), { v in v * cos(x) })
}

@inlinable
@derivative(of: cos)
func _vjpCos(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (cos(x), { v in -v * sin(x) })
}

@inlinable
@derivative(of: tan)
func _vjpTan(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  let value = tan(x)
  return (value, { v in v * (1 + value * value) })
}

@inlinable
@derivative(of: asin)
func _vjpAsin(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (asin(x), { v in v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: acos)
func _vjpAcos(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (acos(x), { v in -v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: atan)
func _vjpAtan(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (atan(x), { v in v / (1 + x * x) })
}

@inlinable
@derivative(of: sinh)
func _vjpSinh(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (sinh(x), { v in v * cosh(x) })
}

@inlinable
@derivative(of: cosh)
func _vjpCosh(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (cosh(x), { v in v * sinh(x) })
}

@inlinable
@derivative(of: tanh)
func _vjpTanh(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  let value = tanh(x)
  return (value, { v in v * (1 - value * value) })
}

@inlinable
@derivative(of: asinh)
func _vjpAsinh(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (asinh(x), { v in v / sqrt(1 + x * x) })
}

@inlinable
@derivative(of: acosh)
func _vjpAcosh(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (acosh(x), { v in v / sqrt(x * x - 1) })
}

@inlinable
@derivative(of: atanh)
func _vjpAtanh(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (atanh(x), { v in v / (1 - x * x) })
}

@inlinable
@derivative(of: expm1)
func _vjpExpm1(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (expm1(x), { v in exp(x) * v })
}

@inlinable
@derivative(of: log1p)
func _vjpLog1p(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (log1p(x), { v in v / (x + 1) })
}

@inlinable
@derivative(of: erf)
func _vjpErf(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (erf(x), { v in v * Double(M_2_SQRTPI) * exp(-x * x) })
}

@inlinable
@derivative(of: erfc)
func _vjpErfc(_ x: Double) -> (value: Double, pullback: (Double) -> Double) {
  return (erfc(x), { v in v * -Double(M_2_SQRTPI) * exp(-x * x) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 140)
#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 142)
@inlinable
@derivative(of: exp)
func _vjpExp(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  let value = exp(x)
  return (value, { v in value * v })
}

@inlinable
@derivative(of: exp2)
func _vjpExp2(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  let value = exp2(x)
  return (value, { v in v * Float80(M_LN2) * value })
}

@inlinable
@derivative(of: log)
func _vjpLog(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (log(x), { v in v / x })
}

@inlinable
@derivative(of: log10)
func _vjpLog10(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (log10(x), { v in v * Float80(M_LOG10E) / x })
}

@inlinable
@derivative(of: log2)
func _vjpLog2(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (log2(x), { v in v / (Float80(M_LN2) * x) })
}

@inlinable
@derivative(of: sin)
func _vjpSin(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (sin(x), { v in v * cos(x) })
}

@inlinable
@derivative(of: cos)
func _vjpCos(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (cos(x), { v in -v * sin(x) })
}

@inlinable
@derivative(of: tan)
func _vjpTan(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  let value = tan(x)
  return (value, { v in v * (1 + value * value) })
}

@inlinable
@derivative(of: asin)
func _vjpAsin(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (asin(x), { v in v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: acos)
func _vjpAcos(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (acos(x), { v in -v / sqrt(1 - x * x) })
}

@inlinable
@derivative(of: atan)
func _vjpAtan(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (atan(x), { v in v / (1 + x * x) })
}

@inlinable
@derivative(of: sinh)
func _vjpSinh(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (sinh(x), { v in v * cosh(x) })
}

@inlinable
@derivative(of: cosh)
func _vjpCosh(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (cosh(x), { v in v * sinh(x) })
}

@inlinable
@derivative(of: tanh)
func _vjpTanh(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  let value = tanh(x)
  return (value, { v in v * (1 - value * value) })
}

@inlinable
@derivative(of: asinh)
func _vjpAsinh(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (asinh(x), { v in v / sqrt(1 + x * x) })
}

@inlinable
@derivative(of: acosh)
func _vjpAcosh(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (acosh(x), { v in v / sqrt(x * x - 1) })
}

@inlinable
@derivative(of: atanh)
func _vjpAtanh(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (atanh(x), { v in v / (1 - x * x) })
}

@inlinable
@derivative(of: expm1)
func _vjpExpm1(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (expm1(x), { v in exp(x) * v })
}

@inlinable
@derivative(of: log1p)
func _vjpLog1p(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (log1p(x), { v in v / (x + 1) })
}

@inlinable
@derivative(of: erf)
func _vjpErf(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (erf(x), { v in v * Float80(M_2_SQRTPI) * exp(-x * x) })
}

@inlinable
@derivative(of: erfc)
func _vjpErfc(_ x: Float80) -> (value: Float80, pullback: (Float80) -> Float80) {
  return (erfc(x), { v in v * -Float80(M_2_SQRTPI) * exp(-x * x) })
}

// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 273)
#endif
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 277)

// Binary functions
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 283)
@inlinable
@derivative(of: pow)
func _vjpPow(_ x: Float, _ y: Float) -> (value: Float, pullback: (Float) -> (Float, Float)) {
  let value = pow(x, y)
  return (value, { v in (
    v * y * pow(x, y - 1), v * value * log(x.isLessThanOrEqualTo(0) ? Float(1) : x)
  ) })
}

@inlinable
@derivative(of: pow)
func _jvpPow(_ x: Float, _ y: Float) -> (value: Float, differential: (Float, Float) -> Float) {
  let value = pow(x, y)
  return (value, { (dx, dy) in
    dx * y * pow(x, y - 1) + dy * value * log(x.isLessThanOrEqualTo(0) ? Float(1) : x)
  })
}
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 281)
#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 283)
@inlinable
@derivative(of: pow)
func _vjpPow(_ x: Float80, _ y: Float80) -> (value: Float80, pullback: (Float80) -> (Float80, Float80)) {
  let value = pow(x, y)
  return (value, { v in (
    v * y * pow(x, y - 1), v * value * log(x.isLessThanOrEqualTo(0) ? Float80(1) : x)
  ) })
}

@inlinable
@derivative(of: pow)
func _jvpPow(_ x: Float80, _ y: Float80) -> (value: Float80, differential: (Float80, Float80) -> Float80) {
  let value = pow(x, y)
  return (value, { (dx, dy) in
    dx * y * pow(x, y - 1) + dy * value * log(x.isLessThanOrEqualTo(0) ? Float80(1) : x)
  })
}
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/Differentiation/TgmathDerivatives.swift.gyb", line: 301)
#endif
