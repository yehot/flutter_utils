import 'package:flutter/material.dart';
import 'app_mixin/module_mixin.dart';

late AppBase app;

abstract class AppBase with ModuleMixin {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  GlobalKey<NavigatorState> get globalKey => navigatorKey;

  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  @required
  void init();
}
