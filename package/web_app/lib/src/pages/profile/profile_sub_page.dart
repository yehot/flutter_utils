import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileSubPage extends StatelessWidget {
  const ProfileSubPage({
    required this.title,
  });

  final String title;
  
  @override
  Widget build(BuildContext context) {
    // var bg = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          title,
        ),
      ),
    );
  }
}
