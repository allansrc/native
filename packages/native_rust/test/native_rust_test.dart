import 'package:flutter_test/flutter_test.dart';
import 'package:native_rust/native_rust.dart';
import 'package:native_rust/native_rust_platform_interface.dart';
import 'package:native_rust/native_rust_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeRustPlatform
    with MockPlatformInterfaceMixin
    implements NativeRustPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeRustPlatform initialPlatform = NativeRustPlatform.instance;

  test('$MethodChannelNativeRust is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeRust>());
  });

  test('getPlatformVersion', () async {
    NativeRust nativeRustPlugin = NativeRust();
    MockNativeRustPlatform fakePlatform = MockNativeRustPlatform();
    NativeRustPlatform.instance = fakePlatform;

    expect(await nativeRustPlugin.getPlatformVersion(), '42');
  });
}
