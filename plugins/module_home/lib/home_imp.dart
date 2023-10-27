import 'package:flutter/src/widgets/framework.dart';
import 'package:library_core/module/app_tab.dart';
import 'package:library_core/modules/home.dart';

import 'pages/home_page.dart';

class HomeImp extends Home {

  @override
  Future<void> init() async {
    throw UnimplementedError();
  }

  @override
  Future<void> afterInit() async {

  }

  @override
  AppTab get tab => AppTab.home;

  @override
  Widget get tabPage => HomePage();

  @override
  int getSomeHomeData() {
    return 1;
  }

  @override
  void gotoSomeSubPage() {
    // push to some page
  }

}