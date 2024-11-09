import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:emulator_util/emulator_util_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEmulatorUtil platform = MethodChannelEmulatorUtil();
  const MethodChannel channel = MethodChannel('emulator_util');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.isEmulator(), '42');
  });
}
