import 'package:flutter/material.dart';
import 'app_mixin/module_mixin.dart';

late AppBase app;

abstract class AppBase with ModuleMixin {
  GlobalKey<NavigatorState> get globalKey;
  BuildContext get context;

  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  @required
  Future<void> init();
}
