import 'package:flutter/material.dart';
import 'package:navigator_demo/navigator/news_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotoNextPage();
        },
      ),
      appBar: AppBar(),
    );
  }

  void gotoNextPage() {
    var route = MaterialPageRoute(builder: (ctx) {
      return const NewsPage();
    });
    Navigator.of(context).push(route);

    // 命名路由
    Navigator.pushNamed(context, 'news_page');

    // Navigator.pop(context);
  }

}
