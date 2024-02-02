import 'package:flutter/material.dart';
import 'app_navigation_rail.dart';
import 'app_top_bar/app_top_bar.dart';

// app 页面左侧导航
class AppNavigation extends StatefulWidget {
  final Widget child;

  const AppNavigation({
    super.key,
    required this.child,
  });

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {

  @override
  Widget build(BuildContext context) {
    // 整个 app 的根节点：
    // - Row 左右结构；
    //    - 左侧是 Rail，固定展示（可改为响应式 收起）
    //    - 右侧是 app 展示区域；上下结构，顶部是 app bar
    return Scaffold(
      body: Row(
        children: [
          const AppNavigationRail(),
          Expanded(
            child: Column(
              children: [
                const AppTopBar(),
                const Divider(height: 1,),
                Expanded(
                  child: widget.child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
