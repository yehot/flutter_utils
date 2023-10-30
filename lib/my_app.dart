import 'package:flutter/material.dart';
import 'package:flutter_utils/main_tab/main_tab_page.dart';
import 'package:library_core/app_base.dart';
import 'package:library_core/i18n/i18n_manager.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainTabPage(),
      navigatorObservers: [app.routeObserver],
      // 多语言配置
      locale: I18nManager.instance.locale,
      supportedLocales: I18nManager.instance.supportedLocales,
      localizationsDelegates: I18nManager.instance.localizationsDelegates,
      localeResolutionCallback: I18nManager.instance.localResolutionCallback,
    );
  }
}
