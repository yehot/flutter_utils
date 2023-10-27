import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'text_styles.dart';
import 'x_colors.dart';

// 以下代码待梳理
typedef ThemeFactory = XThemeData Function(Brightness brightness);

late ThemeFactory _themeFactory;

late XThemeData _themeData;

late Function() _onThemeChanged;

ThemeFactory get themeFactory => _themeFactory;

/// 当前主题数据
XThemeData get themeData => _themeData;


/// 初始化主题
void initTheme({
  required ThemeFactory themeFactory,
  required Function() onThemeChanged,
  Brightness brightness = Brightness.light,
}) {
  _themeFactory = themeFactory;
  _onThemeChanged = onThemeChanged;
  updateTheme(brightness);
}

/// 更新主题，主题切换时调用
void updateTheme(Brightness brightness) {
  _themeData = _themeFactory(brightness);
  _onThemeChanged();
}


/// 主题数据
/// 样式命名规范：控件名称+样式名称，默认样式不用加样式名称
abstract class XThemeData {
  const XThemeData();

  /// 主题亮度
  Brightness get brightness;
  /// 系统主题样式
  ThemeData get systemTheme;
  /// 状态栏样式
  SystemUiOverlayStyle get systemOverlay;

  /// 颜色集
  XColors get colors;

  /// light模式颜色集，视觉标注为不随模式切换时使用
  XColors get colorsLight;

  /// dark模式颜色集，视觉标注为不随模式切换时使用
  XColors get colorsDark;

  /// 字体样式
  TextStyles get textStyles;

  /// 图标集
  // XIcons get icons;


}
