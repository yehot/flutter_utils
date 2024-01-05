import 'package:flutter/material.dart';


class App1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Navigator 1.0 的页面注册方式
    routes: <String, WidgetBuilder> {
        '/login': (_) => HomeScreen(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          child: Text('View Details'),
          onTap: () {},
        ),
      ),
    );
  }


  void pushPage(BuildContext context) {
    // Navigator 1.0 打开页面的方式
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }),);

    // 使用命名路由时都需要预先定义好需要打开的页面，
    // 尽管我们也可以在各个页面之间传递数据，但这种方式原生并不支持直接解析路由参数，如不能使用 Web 应用中的链接形式 /details/:id 的路由名称
    Navigator.pushNamed(context, '/details', arguments: {"key":"1"});

    Navigator.pop(context);
  }

}
