import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';
import 'package:module_home/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(HOME.of(context).home_title),
      ),
      body: Text(HOME.of(context).home_title),
    );
  }

  void test() {
    // 获取其它 module 记录的数据
    int num = app.mine.getSomeMineData();
    debugPrint("$num");
  }
}
