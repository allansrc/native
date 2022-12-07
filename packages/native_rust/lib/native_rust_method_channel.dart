import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_rust_platform_interface.dart';

/// An implementation of [NativeRustPlatform] that uses method channels.
class MethodChannelNativeRust extends NativeRustPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_rust');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
