import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class TaskPage extends StatelessWidget {
  const TaskPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          RouteDefine.task,
        ),
      ),
    );
  }
}
