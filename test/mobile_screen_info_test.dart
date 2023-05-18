import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_screen_info/mobile_screen_info.dart';
import 'package:mobile_screen_info/mobile_screen_info_platform_interface.dart';
import 'package:mobile_screen_info/mobile_screen_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMobileScreenInfoPlatform
    with MockPlatformInterfaceMixin
    implements MobileScreenInfoPlatform {

  @override
  Future<Map<String, dynamic>?> getScreenInfo() {
    // TODO: implement getScreenInfo
    throw UnimplementedError();
  }
}

void main() {
  final MobileScreenInfoPlatform initialPlatform = MobileScreenInfoPlatform.instance;

  test('$MethodChannelMobileScreenInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMobileScreenInfo>());
  });

  test('getPlatformVersion', () async {
    MobileScreenInfo mobileScreenInfoPlugin = MobileScreenInfo();
    MockMobileScreenInfoPlatform fakePlatform = MockMobileScreenInfoPlatform();
    MobileScreenInfoPlatform.instance = fakePlatform;

    expect(await mobileScreenInfoPlugin.getScreenInfo(), '42');
  });
}
