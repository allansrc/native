import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_rust_method_channel.dart';

abstract class NativeRustPlatform extends PlatformInterface {
  /// Constructs a NativeRustPlatform.
  NativeRustPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeRustPlatform _instance = MethodChannelNativeRust();

  /// The default instance of [NativeRustPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeRust].
  static NativeRustPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeRustPlatform] when
  /// they register themselves.
  static set instance(NativeRustPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
