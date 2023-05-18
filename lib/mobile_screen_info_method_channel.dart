import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mobile_screen_info_platform_interface.dart';

/// An implementation of [MobileScreenInfoPlatform] that uses method channels.
class MethodChannelMobileScreenInfo extends MobileScreenInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile_screen_info');

  @override
  Future<Map<String, dynamic>?> getScreenInfo() async {
    final version = await methodChannel
        .invokeMethod<Map<dynamic, dynamic>>('getScreenInfo');
    final Map<String, dynamic> result = {};
    (version as Map<dynamic, dynamic>).forEach((key, value) {
      result[key as String] = value;
    });
    return result;
  }
}
