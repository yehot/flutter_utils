import 'package:flutter/material.dart';

late App app;

abstract class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  GlobalKey<NavigatorState> get globalKey => navigatorKey;

  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  @protected
  void init() {
    app = this;
  }


  @protected
  Future<void> beforeInit() async {}

  @protected
  Future<void> afterInit() async {}

  @protected
  void registerModules();
}

class Application extends App {
  @override
  void init() {
    super.init();

  }

  @override
  void registerModules() {
    // TODO: implement registerModules
  }
}
