import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("首页"),
      ),
      body: Text("首页"),
    );
  }

  void test() {
    // 获取其它 module 记录的数据
    int num = app.mine.getSomeMineData();
    debugPrint("$num");
  }
}
