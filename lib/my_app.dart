import 'package:flutter/material.dart';
import 'package:flutter_utils/home/home_page.dart';
import 'package:library_core/app_base.dart';


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
      home: const MyHomePage(title: 'Home page'),
      navigatorObservers: [app.routeObserver],
    );
  }
}
