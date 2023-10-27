import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_utils/my_app.dart';
import 'package:library_core/env/package_env.dart';

import 'application.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    // 类似 iOS 的 AppDelegate，sdk 的初始化、app 配置都在这里
    Application().init();

    if (PackageEnv.isDebug) {
      // 添加调试工具
      runApp(const MyApp());
    } else {
      runApp(const MyApp());
    }
  }, (error, stack) {
    debugPrint('main error:${error.toString()}');
    debugPrintStack(stackTrace: stack);
  });
}
