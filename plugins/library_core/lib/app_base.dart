import 'package:flutter/material.dart';
import 'app_mixin/module_mixin.dart';
import 'app_mixin/navigator_mixin.dart';

late AppBase app;

abstract class AppBase with ModuleMixin, NavigatorMixin {
  GlobalKey<NavigatorState> get globalKey;
  BuildContext get context;

  @required
  Future<void> init();
}
