import 'package:flutter/material.dart';
import 'package:library_core/generated/l10n.dart';

/// 定义 app 主 tab 的 page
abstract class AppTabPage {
  @required
  Widget get tabPage;

  @required
  AppTab get tab;
}

enum AppTab {
  home(1),
  mine(2),
  market(3);

  final int val;
  const AppTab(this.val);

  String get sName {
    switch(this) {
      case AppTab.home:
        // print("------ 切换 tab ${S.current.hashCode}");
        return S.current.home;
      case AppTab.mine:
        return S.current.mine;
      case AppTab.market:
        return "市场";
    }
  }

  // tab 的 image
  String get imageName {
    return sName;
  }

}

