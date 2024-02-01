import 'package:flutter/material.dart';
import 'package:library_core/module/app_tab.dart';


class AppTabInfo {
  AppTab tab;
  Widget tagPage;
  Object? arguments;
  bool needLogin;

  AppTabInfo(this.tab, this.tagPage, {this.needLogin = false});

  @override
  String toString() {
    return tab.name;
  }
}
