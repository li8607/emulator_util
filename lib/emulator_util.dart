
import 'emulator_util_platform_interface.dart';

class EmulatorUtil {
  Future<bool?> isEmulator() {
    return EmulatorUtilPlatform.instance.isEmulator();
  }
}
