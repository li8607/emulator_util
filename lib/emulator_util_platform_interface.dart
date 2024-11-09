import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'emulator_util_method_channel.dart';

abstract class EmulatorUtilPlatform extends PlatformInterface {
  /// Constructs a EmulatorUtilPlatform.
  EmulatorUtilPlatform() : super(token: _token);

  static final Object _token = Object();

  static EmulatorUtilPlatform _instance = MethodChannelEmulatorUtil();

  /// The default instance of [EmulatorUtilPlatform] to use.
  ///
  /// Defaults to [MethodChannelEmulatorUtil].
  static EmulatorUtilPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EmulatorUtilPlatform] when
  /// they register themselves.
  static set instance(EmulatorUtilPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isEmulator() {
    throw UnimplementedError('isEmulator() has not been implemented.');
  }
}
