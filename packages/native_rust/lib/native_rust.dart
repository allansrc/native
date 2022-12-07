import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'native_rust_platform_interface.dart';

typedef add_func = Int64 Function(Int64 a, Int64 b);
typedef Add = int Function(int a, int b);

class Adder {
  static DynamicLibrary? _lib;

  Adder() {
    if (_lib != null) return;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      _lib = load(basePath: '../../../target/debug/');
    } else {
      _lib = load();
    }
  }

  DynamicLibrary? load({String basePath = ''}) {
    if (Platform.isAndroid || Platform.isLinux) {
      return DynamicLibrary.open('${basePath}libadder_ffi.so');
    }
    if (Platform.isIOS) {
      return DynamicLibrary.process();
    }
    if (Platform.isMacOS) {
      return DynamicLibrary.open('libadder_ffi.a');
    }
    if (Platform.isWindows) {
      return DynamicLibrary.open('${basePath}libadder_ffi.dll');
    }
    throw NotSupportedPlatform('${Platform.operatingSystem} is not supported!');
  }

  int add(int a, int b) {
    final addPointer = _lib?.lookup<NativeFunction<add_func>>('add');

    final sum = addPointer?.asFunction<Add>();
    if (sum != null) {
      final result = sum(a, b);
      return result;
    } else {
      return 10000;
    }
  }
}

class NotSupportedPlatform implements Exception {
  NotSupportedPlatform(String s);
}

typedef AdderFunction = Pointer<Utf8> Function(Pointer<Utf8>);
typedef AdderFunctionFFI = Pointer<Utf8> Function(Pointer<Utf8>);

class NativeRust {
  Future<String?> getPlatformVersion() {
    return NativeRustPlatform.instance.getPlatformVersion();
  }

  String getAdderValues() {
    final DynamicLibrary adderNative = Platform.isAndroid
        ? DynamicLibrary.open("libadder_ffi.so")
        : DynamicLibrary.process();

    final AdderFunction rustAdder = adderNative
        .lookup<NativeFunction<AdderFunctionFFI>>("add")
        .asFunction();

    return '';
  }
}
