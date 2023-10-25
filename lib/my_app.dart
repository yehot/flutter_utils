import 'package:flutter/material.dart';
import 'package:flutter_utils/home/home_page.dart';
import 'package:usage_demo/singleton/app_singleton.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home page'),
      navigatorObservers: [app.routeObserver],
    );
  }
}
