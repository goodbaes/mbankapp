import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

import 'package:device_info_plus/device_info_plus.dart';

abstract class MapAvailableUtil {
  static Future<bool> isMapAvailable() async {
    if (isAvalible != null) return isAvalible!;
    if (!Platform.isAndroid) return true;
    final info = await DeviceInfoPlugin().androidInfo;
    isAvalible = info.version.sdkInt >= 26;
    if (isAvalible ?? false) {
      init.initMapkit(apiKey: dotenv.env['YANDEX_MAPS_API_KEY'] ?? '');
    }
    return isAvalible!;
  }

  static bool? isAvalible;
}
