import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mobile_screen_info/mobile_screen_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScreenInfo? _screenInfo;
  final _mobileScreenInfoPlugin = MobileScreenInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    ScreenInfo? screenInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      screenInfo = await _mobileScreenInfoPlugin.getScreenInfo();
    } on PlatformException {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _screenInfo = screenInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Screen Info'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('PPI: ${_screenInfo?.ppi}'),
              Text('Scale: ${_screenInfo?.scale}'),
              Text('Width: ${_screenInfo?.width}'),
              Text('Height: ${_screenInfo?.height}'),
              Text('Width in CM: ${_screenInfo?.widthInCm}'),
              Text('Height in CM: ${_screenInfo?.heightInCm}'),
              Text('Width in Inch: ${_screenInfo?.widthInInch}'),
              Text('Height in Inch: ${_screenInfo?.heightInInch}'),
            ],
          ),
        ),
      ),
    );
  }
}

