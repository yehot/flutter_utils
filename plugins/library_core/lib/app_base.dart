import 'package:flutter/material.dart';
import 'app_mixin/module_mixin.dart';
import 'app_mixin/navigator_mixin.dart';

late IAppBase app;

// 用 NavigatorMixin 不太好，app.push 不如拆到 app.router.push
abstract class IAppBase with ModuleMixin, NavigatorMixin {
  GlobalKey<NavigatorState> get globalKey;
  BuildContext get context;

  @required
  Future<void> init();
}
