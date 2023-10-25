import 'package:flutter/material.dart';

late App app;

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  GlobalKey<NavigatorState> get globalKey => navigatorKey;

  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  void init() {
    app = this;
  }
}
