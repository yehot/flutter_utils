import 'dart:async';
import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';
import 'application.dart';
import 'my_app.dart';

void run_app() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 类似 iOS 的 AppDelegate，sdk 的初始化、app 配置都在这里
    await Application().init();

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
