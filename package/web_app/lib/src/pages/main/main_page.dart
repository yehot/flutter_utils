
// import 'package:admin/panel/controllers/MenuAppController.dart';
// import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
      ),
    );
    // return Provider(
    //   create: (_)=> MenuAppController(),
    //   child: MainScreen(),
    // );
  }
}
