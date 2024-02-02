import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          RouteDefine.profile,
        ),
      ),
    );
  }
}
