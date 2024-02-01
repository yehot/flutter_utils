import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_core/library_core.dart';
import 'package:main_app/app/main/main_tab_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  MyRouterDelegate _routerDelegate = MyRouterDelegate(
    home: MainTabPage(),
    navigatorKey: app.globalKey,
    observers: <NavigatorObserver>[
      MyNavigatorObserver(),
    ],
  );
  // 设置 home 和 initial Route Path
  // ..setInitialRoutePath(configuration),


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // .value 传入一个变量，不能传入一个 构造对象
        ChangeNotifierProvider.value(value: I18nManager.instance),
        // .create 必须传入一个构造对象，不能传入一个变量
        // ChangeNotifierProvider(create: (_)=> I18nManager.instance,), // 错误用法
      ],
      child: Selector<I18nManager, Locale>(
        selector: (_, v) => v.locale,
        builder: (_, local, __) {
          return MaterialApp.router(
            // home: MainTabPage(),
            routerDelegate: _routerDelegate,
            debugShowCheckedModeBanner: false,
            // 多语言配置
            locale: local,
            supportedLocales: I18nManager.instance.supportedLocales,
            localizationsDelegates: [
              ...I18nManager.instance.localizationsDelegates,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: I18nManager.instance.localResolutionCallback,
          );
        },
      ),
    );
  }
}
