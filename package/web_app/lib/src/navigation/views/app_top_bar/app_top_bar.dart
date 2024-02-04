import 'package:flutter/material.dart';
import 'package:web_app/src/navigation/views/app_top_bar/route_back_indicator.dart';

import 'router_indicator.dart';

// app 主面板顶部 app bar
class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Row(
        children: [
          const SizedBox(width: 16),
          // const RouteBackIndicator(),
          const RouterIndicator(),

        ],
      ),
    );
  }
}

