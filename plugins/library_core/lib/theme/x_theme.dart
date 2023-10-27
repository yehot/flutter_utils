import 'package:flutter/material.dart';
import 'x_theme_data.dart';

class XTheme extends InheritedWidget {
  const XTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static XThemeData of(BuildContext context) {
    final XTheme? xTheme = context.dependOnInheritedWidgetOfExactType<XTheme>();
    assert(xTheme != null);
    return xTheme!.data;
  }

  final XThemeData data;

  @override
  bool updateShouldNotify(covariant XTheme oldWidget) {
    return oldWidget.data != data;
  }
}

// class XThemeLight extends StatelessWidget {
//   const XThemeLight({
//     Key? key,
//     required this.builder,
//   }) : super(key: key);
//
//   final WidgetBuilder builder;
//
//   @override
//   Widget build(BuildContext context) {
//     final XThemeData themeData = themeFactory(Brightness.light);
//     return XTheme(
//       data: themeData,
//       child: Theme(data: themeData.systemTheme, child: Builder(builder: builder)),
//     );
//   }
// }
//
// class XThemeDark extends StatelessWidget {
//   const XThemeDark({
//     Key? key,
//     required this.builder,
//   }) : super(key: key);
//
//   final WidgetBuilder builder;
//
//   @override
//   Widget build(BuildContext context) {
//     final XThemeData themeData = themeFactory(Brightness.dark);
//     return XTheme(
//       data: themeData,
//       child: Theme(data: themeData.systemTheme, child: Builder(builder: builder)),
//     );
//   }
// }
