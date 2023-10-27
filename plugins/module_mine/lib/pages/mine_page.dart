import 'package:flutter/material.dart';
import 'package:module_mine/generated/l10n.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(MINE.of(context).mine_title),
      ),
      body: Text(MINE.of(context).mine_title),
    );
  }
}
