import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mobile_screen_info_method_channel.dart';

abstract class MobileScreenInfoPlatform extends PlatformInterface {
  /// Constructs a MobileScreenInfoPlatform.
  MobileScreenInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static MobileScreenInfoPlatform _instance = MethodChannelMobileScreenInfo();

  /// The default instance of [MobileScreenInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelMobileScreenInfo].
  static MobileScreenInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MobileScreenInfoPlatform] when
  /// they register themselves.
  static set instance(MobileScreenInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<String, dynamic>?> getScreenInfo() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
