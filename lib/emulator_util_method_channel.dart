import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'emulator_util_platform_interface.dart';

/// An implementation of [EmulatorUtilPlatform] that uses method channels.
class MethodChannelEmulatorUtil extends EmulatorUtilPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('emulator_util');

  @override
  Future<bool?> isEmulator() async {
    final version = await methodChannel.invokeMethod<bool>('isEmulator');
    return version;
  }
}
