import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          RouteDefine.notification,
        ),
      ),
    );
  }
}
