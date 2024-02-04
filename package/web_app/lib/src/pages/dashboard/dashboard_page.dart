import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          RouteDefine.dashboard,
        ),
      ),
    );
  }
}
