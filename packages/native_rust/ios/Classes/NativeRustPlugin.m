#import "NativeRustPlugin.h"
#if __has_include(<native_rust/native_rust-Swift.h>)
#import <native_rust/native_rust-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "native_rust-Swift.h"
#endif

@implementation NativeRustPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeRustPlugin registerWithRegistrar:registrar];
}
@end
