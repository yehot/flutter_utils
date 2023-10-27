import 'package:flutter/material.dart';
import 'package:flutter_utils/home/home_page.dart';
import 'package:library_core/app_base.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Home page'),
      navigatorObservers: [app.routeObserver],
    );
  }
}
