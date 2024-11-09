import 'package:flutter_test/flutter_test.dart';
import 'package:emulator_util/emulator_util.dart';
import 'package:emulator_util/emulator_util_platform_interface.dart';
import 'package:emulator_util/emulator_util_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEmulatorUtilPlatform
    with MockPlatformInterfaceMixin
    implements EmulatorUtilPlatform {
  
  @override
  Future<bool?> isEmulator() {
    return Future.value(true);
  }
}

void main() {
  final EmulatorUtilPlatform initialPlatform = EmulatorUtilPlatform.instance;

  test('$MethodChannelEmulatorUtil is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEmulatorUtil>());
  });

  test('getPlatformVersion', () async {
    EmulatorUtil emulatorUtilPlugin = EmulatorUtil();
    MockEmulatorUtilPlatform fakePlatform = MockEmulatorUtilPlatform();
    EmulatorUtilPlatform.instance = fakePlatform;

    expect(await emulatorUtilPlugin.isEmulator(), '42');
  });
}
