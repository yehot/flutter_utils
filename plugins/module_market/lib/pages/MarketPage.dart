import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // print("home- rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        // title: Text(S.of(context).home_title),
        // TODO: 必须使用 of 才能保证切换语言时，正确刷新
        title: const Text("Market"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


          ],
        ),
      ),
    );
  }
}
