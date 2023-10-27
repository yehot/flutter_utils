import 'package:flutter/material.dart';

/// 定义 app 主 tab 的 page
abstract class AppTabPage {
  @required
  Widget get tabPage;

  @required
  AppTab get tab;
}

enum AppTab {
  home(1),
  mine(2);

  final int val;
  const AppTab(this.val);

  String get sName {
    switch(this) {
      case AppTab.home:
        return "首页";
      case AppTab.mine:
        return "我的";
    }
  }

  // tab 的 image
  String get imageName {
    return sName;
  }

}

