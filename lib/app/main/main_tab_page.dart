import 'package:flutter/material.dart';
import 'package:flutter_utils/app/demo/launch_screen_page.dart';
import 'package:get/get.dart';
import 'package:library_core/app_base.dart';
import 'package:library_core/module/app_tab.dart';
import 'app_tab_info.dart';
import 'main_tab_controller.dart';



class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  late MainTabController mainTabController;

  @override
  void initState() {
    super.initState();

    if (Get.isRegistered<MainTabController>()) {
      mainTabController = Get.find();
    } else {
      mainTabController = Get.put(MainTabController());
    }
    mainTabController.pageController.addListener(() {
      // if (_selectedIndex.value == 1) {
      //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      //     return LaunchScreenPage(title: "title");
      //   }));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: mainTabController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: tabInfoList.map((pageInfo) => pageInfo.tagPage).toList(),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: mainTabController.currentIndex,
        builder: (_, int value, __) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: tabInfoList[0].tab.sName,
                icon: Icon(Icons.account_balance),
                activeIcon: Icon(Icons.account_balance),
              ),
              BottomNavigationBarItem(
                label: tabInfoList[1].tab.sName,
                icon: Icon(Icons.people_alt_outlined),
                activeIcon: Icon(Icons.people_alt_outlined),
              ),
            ],
            onTap: (int index) {
              mainTabController.changeToPage(index);
            },
            currentIndex: value,
          );
        },
      ),
    );
  }


}

