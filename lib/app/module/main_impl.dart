import 'package:flutter_utils/app/main/main_tab_controller.dart';
import 'package:get/get.dart';
import 'package:library_core/module/app_tab.dart';
import 'package:library_core/modules/main.dart';

/// 回调接口
class MainImpl extends Main {
  @override
  Future<void> init() async {}

  @override
  Future<void> afterInit() async {}

  @override
  void changeToTab(AppTab tab) {
    // 使用 GetX 可以不依赖 context
    // 但是依赖链路会变得很分散且没有约束，Provider 会更集中一点，都挂在根节点
    Get.find<MainTabController>().changeToTab(tab);
  }

  @override
  AppTab currentTab() {
    return Get.find<MainTabController>().currentTab();
  }

}
