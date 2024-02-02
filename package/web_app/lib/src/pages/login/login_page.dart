import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/route/route_define.dart';


class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login Page',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                GoRouter.of(context).go(RouteDefine.home);
              },
              child: Text('点击进入'),
            ),
          ],
        ),
      ),
    );
  }
}
