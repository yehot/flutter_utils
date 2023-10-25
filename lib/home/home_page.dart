import 'package:flutter/material.dart';
import 'package:flutter_utils/home/home_page_2.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 使用 modal_bottom_sheet 时，如果 root page 的 route 不是被 modal_bottom_sheet 的 MaterialWithModalsPageRoute 包裹

          // 需要将改为父页面 push 时使用  modal_bottom_sheet 的 MaterialWithModalsPageRoute
          // 这样能保证子节点有 modal 效果
          Navigator.of(context).push(MaterialWithModalsPageRoute(builder: (ctx) => const HomePage2()));
        },
      ),
    );
  }
}

