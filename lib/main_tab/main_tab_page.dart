import 'package:flutter/material.dart';
import 'package:flutter_utils/demo/launch_screen_page.dart';
import 'package:library_core/app_base.dart';
import 'package:library_core/module/app_tab.dart';
import 'app_tab_info.dart';


final _tabInfoList = <AppTabInfo>[
  AppTabInfo(AppTab.home, app.home.tabPage),
  AppTabInfo(AppTab.mine, app.mine.tabPage),
];


class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  final PageController _pageController = PageController();
  ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
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
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabInfoList.map((pageInfo) => pageInfo.tagPage).toList(),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (_, int value, __) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: _tabInfoList[0].tab.sName,
                icon: Icon(Icons.account_balance),
                activeIcon: Icon(Icons.account_balance),
              ),
              BottomNavigationBarItem(
                label: _tabInfoList[1].tab.sName,
                icon: Icon(Icons.people_alt_outlined),
                activeIcon: Icon(Icons.people_alt_outlined),
              ),
            ],
            onTap: (int index) {
              _selectedIndex.value = index;
              _pageController.jumpToPage(index);
            },
            currentIndex: value,
          );
        },
      ),
    );
  }


}

