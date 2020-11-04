// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 1)
//===--- SwiftNativeNSXXXBase.mm.gyb - Cocoa classes with fast refcounts --===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
//
// Classes derived from ObjC bases but that use native swift reference
// counting, layout, and allocation.
//
// These classes declare a native Swift object header and override the
// NSObject methods that do reference counting to use it accordingly.
// We can only do this trick with objc classes that are known not to
// use the storage where Swift places its native object header.  This
// takes care of how the classes are handled from Objective-C code.
//    _NSSwiftArrayBase, _NSSwiftDictionaryBase, _NSSwiftSetBase
//    _NSSwiftSetBase, _NSSwiftStringBase
//
// To trick Swift into using its fast refcounting and allocation
// directly (rather than going through objc_msgSend to arrive at the
// implementations defined here), we define subclasses on the Swift
// side but we establish the inheritance relationship with
// the special @_swift_native_objc_runtime_base attribute rather
// than directly subclassing the classes defined here.
//
//===----------------------------------------------------------------------===//

#include "swift/Runtime/Config.h"

#if SWIFT_OBJC_INTEROP
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#include <objc/NSObject.h>
#include <objc/runtime.h>
#include <objc/objc.h>
#include "swift/Runtime/HeapObject.h"
#include "swift/Runtime/Metadata.h"
#include "swift/Runtime/ObjCBridge.h"
#include "llvm/ADT/DenseMap.h"
#include <stdio.h>
#include <stdlib.h>

using namespace swift;

// NOTE: older runtimes called these _SwiftNativeNSXXXBase. The two must
// coexist, so these were renamed. The old names must not be used in the new
// runtime.
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 54)
SWIFT_RUNTIME_STDLIB_API
@interface __SwiftNativeNSArrayBase : NSObject
{
 @private
  SWIFT_HEAPOBJECT_NON_OBJC_MEMBERS;
}
@end


@implementation __SwiftNativeNSArrayBase

- (id)initWithCoder: (NSCoder *)coder {
  return [super init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
  return NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-super-calls"

STANDARD_OBJC_METHOD_IMPLS_FOR_SWIFT_OBJECTS

#pragma clang diagnostic pop

@end
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 54)
SWIFT_RUNTIME_STDLIB_API
@interface __SwiftNativeNSMutableArrayBase : NSObject
{
 @private
  SWIFT_HEAPOBJECT_NON_OBJC_MEMBERS;
}
@end


@implementation __SwiftNativeNSMutableArrayBase

- (id)initWithCoder: (NSCoder *)coder {
  return [super init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
  return NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-super-calls"

STANDARD_OBJC_METHOD_IMPLS_FOR_SWIFT_OBJECTS

#pragma clang diagnostic pop

@end
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 54)
SWIFT_RUNTIME_STDLIB_API
@interface __SwiftNativeNSDictionaryBase : NSObject
{
 @private
  SWIFT_HEAPOBJECT_NON_OBJC_MEMBERS;
}
@end


@implementation __SwiftNativeNSDictionaryBase

- (id)initWithCoder: (NSCoder *)coder {
  return [super init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
  return NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-super-calls"

STANDARD_OBJC_METHOD_IMPLS_FOR_SWIFT_OBJECTS

#pragma clang diagnostic pop

@end
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 54)
SWIFT_RUNTIME_STDLIB_API
@interface __SwiftNativeNSSetBase : NSObject
{
 @private
  SWIFT_HEAPOBJECT_NON_OBJC_MEMBERS;
}
@end


@implementation __SwiftNativeNSSetBase

- (id)initWithCoder: (NSCoder *)coder {
  return [super init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
  return NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-super-calls"

STANDARD_OBJC_METHOD_IMPLS_FOR_SWIFT_OBJECTS

#pragma clang diagnostic pop

@end
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 54)
SWIFT_RUNTIME_STDLIB_API
@interface __SwiftNativeNSStringBase : NSObject
{
 @private
  SWIFT_HEAPOBJECT_NON_OBJC_MEMBERS;
}
@end


@implementation __SwiftNativeNSStringBase

- (id)initWithCoder: (NSCoder *)coder {
  return [super init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
  return NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-super-calls"

STANDARD_OBJC_METHOD_IMPLS_FOR_SWIFT_OBJECTS

#pragma clang diagnostic pop

@end
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 54)
SWIFT_RUNTIME_STDLIB_API
@interface __SwiftNativeNSEnumeratorBase : NSObject
{
 @private
  SWIFT_HEAPOBJECT_NON_OBJC_MEMBERS;
}
@end


@implementation __SwiftNativeNSEnumeratorBase

- (id)initWithCoder: (NSCoder *)coder {
  return [super init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
  return NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-super-calls"

STANDARD_OBJC_METHOD_IMPLS_FOR_SWIFT_OBJECTS

#pragma clang diagnostic pop

@end
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 82)

SWIFT_CC(swift) SWIFT_RUNTIME_STDLIB_SPI
bool
swift_stdlib_NSObject_isEqual(id lhs,
                              id rhs) {
  return (lhs == rhs) || [lhs isEqual:rhs];
}

SWIFT_CC(swift) SWIFT_RUNTIME_STDLIB_SPI
bool
swift_stdlib_connectNSBaseClasses() {
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 94)
  Class NSArraySuper = objc_lookUpClass("NSArray");
  if (!NSArraySuper) return false;
  Class NSArrayOurClass = objc_lookUpClass("__SwiftNativeNSArrayBase");
  if (!NSArrayOurClass) return false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  class_setSuperclass(NSArrayOurClass, NSArraySuper);
#pragma clang diagnostic pop
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 94)
  Class NSMutableArraySuper = objc_lookUpClass("NSMutableArray");
  if (!NSMutableArraySuper) return false;
  Class NSMutableArrayOurClass = objc_lookUpClass("__SwiftNativeNSMutableArrayBase");
  if (!NSMutableArrayOurClass) return false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  class_setSuperclass(NSMutableArrayOurClass, NSMutableArraySuper);
#pragma clang diagnostic pop
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 94)
  Class NSDictionarySuper = objc_lookUpClass("NSDictionary");
  if (!NSDictionarySuper) return false;
  Class NSDictionaryOurClass = objc_lookUpClass("__SwiftNativeNSDictionaryBase");
  if (!NSDictionaryOurClass) return false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  class_setSuperclass(NSDictionaryOurClass, NSDictionarySuper);
#pragma clang diagnostic pop
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 94)
  Class NSSetSuper = objc_lookUpClass("NSSet");
  if (!NSSetSuper) return false;
  Class NSSetOurClass = objc_lookUpClass("__SwiftNativeNSSetBase");
  if (!NSSetOurClass) return false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  class_setSuperclass(NSSetOurClass, NSSetSuper);
#pragma clang diagnostic pop
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 94)
  Class NSStringSuper = objc_lookUpClass("NSString");
  if (!NSStringSuper) return false;
  Class NSStringOurClass = objc_lookUpClass("__SwiftNativeNSStringBase");
  if (!NSStringOurClass) return false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  class_setSuperclass(NSStringOurClass, NSStringSuper);
#pragma clang diagnostic pop
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 94)
  Class NSEnumeratorSuper = objc_lookUpClass("NSEnumerator");
  if (!NSEnumeratorSuper) return false;
  Class NSEnumeratorOurClass = objc_lookUpClass("__SwiftNativeNSEnumeratorBase");
  if (!NSEnumeratorOurClass) return false;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  class_setSuperclass(NSEnumeratorOurClass, NSEnumeratorSuper);
#pragma clang diagnostic pop
// ###sourceLocation(file: "/Users/kateinoigakukun/projects/swiftwasm-source/swift/stdlib/public/stubs/SwiftNativeNSXXXBase.mm.gyb", line: 103)
  return true;
}

#endif

// Local Variables:
// eval: (read-only-mode 1)
// End:
