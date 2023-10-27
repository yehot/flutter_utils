import 'package:flutter/material.dart';
import 'package:library_core/theme/text_styles.dart';
import 'x_theme_data.dart';


extension ColorExt on Color {
  TextStyles get _textStyles => themeData.textStyles;

  TextStyle get l20W500 => _textStyles.l20W500.copyWith(color: this);
  TextStyle get l20W700 => _textStyles.l20W700.copyWith(color: this);
  TextStyle get l24W500 => _textStyles.l24W500.copyWith(color: this);
  TextStyle get l24W700 => _textStyles.l24W700.copyWith(color: this);
  TextStyle get l22W600 => _textStyles.l22W600.copyWith(color: this);
  TextStyle get l26W600 => _textStyles.l26W600.copyWith(color: this);
  TextStyle get l32W800Montserrat => _textStyles.l32W800Montserrat.copyWith(color: this);
  TextStyle get l36W400 => _textStyles.l36W400.copyWith(color: this);
  TextStyle get l36W500 => _textStyles.l36W500.copyWith(color: this);
  TextStyle get l36W600 => _textStyles.l36W600.copyWith(color: this);
  TextStyle get l36W600Montserrat => _textStyles.l36W600Montserrat.copyWith(color: this);
  TextStyle get l40W600 => _textStyles.l40W600.copyWith(color: this);

  TextStyle get l18W700 => _textStyles.l18W700.copyWith(color: this);
  TextStyle get l18W600 => _textStyles.l18W600.copyWith(color: this);
  TextStyle get l18W500 => _textStyles.l18W500.copyWith(color: this);

  TextStyle get l16W600 => _textStyles.l16W600.copyWith(color: this);
  TextStyle get l16W500 => _textStyles.l16W500.copyWith(color: this);
  TextStyle get l16W400 => _textStyles.l16W400.copyWith(color: this);

  TextStyle get l15W400 => _textStyles.l15W400.copyWith(color: this);
  TextStyle get l15W500 => _textStyles.l15W500.copyWith(color: this);
  TextStyle get l15W600 => _textStyles.l15W600.copyWith(color: this);

  TextStyle get l14W400 => _textStyles.l14W400.copyWith(color: this);
  TextStyle get l14W500 => _textStyles.l14W500.copyWith(color: this);
  TextStyle get l14W700 => _textStyles.l14W700.copyWith(color: this);

  TextStyle get l12W600 => _textStyles.l12W600.copyWith(color: this);
  TextStyle get l12W500 => _textStyles.l12W500.copyWith(color: this);
  TextStyle get l12W400 => _textStyles.l12W400.copyWith(color: this);

  TextStyle get l11W500 => _textStyles.l11W500.copyWith(color: this);
  TextStyle get l11W400 => _textStyles.l11W400.copyWith(color: this);

  TextStyle get l10W600 => _textStyles.l10W400.copyWith(color: this);
  TextStyle get l10W500 => _textStyles.l10W500.copyWith(color: this);
  TextStyle get l10W400 => _textStyles.l10W400.copyWith(color: this);

  TextStyle get l13W600 => _textStyles.l13W600.copyWith(color: this);
  TextStyle get l13W500 => _textStyles.l13W500.copyWith(color: this);
  TextStyle get l13W400 => _textStyles.l13W400.copyWith(color: this);

}

