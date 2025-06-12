import 'dart:io';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

import 'package:device_info_plus/device_info_plus.dart';

abstract class MapAvailableUtil {
  static Future<bool> isMapAvailable() async {
    if (isAvalible != null) return isAvalible!;
    if (!Platform.isAndroid) return true;
    final info = await DeviceInfoPlugin().androidInfo;
    isAvalible = info.version.sdkInt >= 26;
    if (isAvalible ?? false) {
      init.initMapkit(apiKey: '99ced02f-0d4e-43a0-aae2-6c274ede3e80');
    }
    return isAvalible!;
  }

  static bool? isAvalible;
}
