import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_core/app_base.dart';
import 'package:library_core/module/app_tab.dart';
import 'app_tab_info.dart';

final tabInfoList = <AppTabInfo>[
  AppTabInfo(AppTab.home, app.home.tabPage),
  AppTabInfo(AppTab.mine, app.mine.tabPage),
];

class MainTabController extends GetxController {

  final PageController pageController = PageController();
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  void changeToPage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void changeToTab(AppTab tab) {
    Navigator.popUntil(app.context, (route) {
      return route.settings.name == '/';
    });

    AppTabInfo info = tabInfoList.first;
    var list = tabInfoList.where((element) => element.tab == tab);
    if (list.isNotEmpty) {
      info = list.first;
    }
    int page = tabInfoList.indexOf(info);
    if (page == -1) {
      page = 0;
    }
    changeToPage(page);
  }

  AppTab currentTab() {
    return tabInfoList[currentIndex.value].tab;
  }

}

