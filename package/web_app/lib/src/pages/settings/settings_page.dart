import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          RouteDefine.settings,
        ),
      ),
    );
  }
}
