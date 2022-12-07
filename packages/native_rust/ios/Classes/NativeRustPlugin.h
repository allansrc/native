#import <Flutter/Flutter.h>

@interface NativeRustPlugin : NSObject<FlutterPlugin>
@end
// NOTE: Append the lines below to ios/Classes/GreeterPlugin.h

int64_t add(int64_t left, int64_t right);
