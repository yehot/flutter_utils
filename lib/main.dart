import 'package:flutter/material.dart';
import 'package:flutter_utils/my_app.dart';
import 'package:usage_demo/singleton/app_singleton.dart';

void main() {
  Application().init();
  runApp(const MyApp());
}
