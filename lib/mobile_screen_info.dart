import 'mobile_screen_info_platform_interface.dart';

class ScreenInfo {
  double ppi;
  double scale;
  double width;
  double height;

  ScreenInfo({
    required this.ppi,
    required this.scale,
    required this.width,
    required this.height,
  });

  factory ScreenInfo.fromMap(Map<String, dynamic> map) {
    return ScreenInfo(
      ppi: map["ppi"],
      scale: map["scale"],
      width: map["width"],
      height: map["height"],
    );
  }

  double get widthInCm => width * scale / ppi * 2.54;

  double get heightInCm => height * scale / ppi * 2.54;

  double get widthInInch => width * scale / ppi;

  double get heightInInch => height * scale / ppi;
}

class MobileScreenInfo {
  Future<ScreenInfo?> getScreenInfo() async {
    final data = await MobileScreenInfoPlatform.instance.getScreenInfo();
    if (data != null) {
      return ScreenInfo.fromMap(data);
    }
    return null;
  }
}
