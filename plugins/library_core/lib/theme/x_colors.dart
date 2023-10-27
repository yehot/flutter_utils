import 'dart:ui';

/// 定义 app 用到的所有颜色
abstract class XColors {
  const XColors();

  /// 主色
  Color get primary;
  Color get primary2;
  Color get primary800;
  Color get primary900;

  /// 文字色
  Color get gray50;
  Color get gray100;
  Color get gray200;
  Color get gray300;
  Color get gray400;
  Color get gray500;
  Color get gray600;
  Color get gray800;


  /// 特殊色（红绿黄）
  Color get red900;
  Color get red900_0_3;
  Color get red900_0_5;
  Color get green900;
  Color get green900_0_3;
  Color get green900_0_5;
  Color get warning900;
  Color get warning50;
  Color get warning25;

  /// 其他颜色，背景、输入框等
  Color get bgGray100;
  Color get baseWhite;
  Color get baseWhite0_5;
  Color get baseBlack;
  Color get baseBlack0_2;
  Color get baseBlack0_5;
  Color get baseWhite0_6;
  Color get bgWhite;

  ///分割线
  Color get divider;

  /// 输入框
  Color get inputStroke;
  Color get inputStrokeHighlight;

  /// 按钮
  Color get buttonDisable;
  Color get buttonStroke1;
  Color get buttonStroke2;
  Color get buttonPrimary;
  Color get appStroke;

  /// 特殊颜色
  Color get colorBTC;
  Color get colorETH;
}
