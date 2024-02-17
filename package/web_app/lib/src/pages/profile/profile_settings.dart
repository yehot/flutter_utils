import 'package:flutter/material.dart';
import 'package:web_app/src/route/profile.dart';
import 'package:web_app/src/route/route_define.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("个人设置"),
      ),
      body: Center(
        child: Text(
          "${RouteDefine.profile} - ${ProfileRouteDefine.settings}",
        ),
      ),
    );
  }
}
