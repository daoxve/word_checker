import 'package:flutter/painting.dart';

class ThemeDetailModel {
  ThemeDetailModel({
    required this.name,
    required this.desc,
    required this.backgroundColor,
    required this.accentColor,
    required this.errorColor,
    required this.errorAccentColor,
    required this.appbarColor,
    required this.textColor,
    required this.statusBarColor,
    required this.navigationBarColor,
  });

  final String name;
  final String desc;
  final Color backgroundColor;
  final Color accentColor;
  final Color errorColor;
  final Color errorAccentColor;
  final Color appbarColor;
  final Color textColor;
  final Color statusBarColor;
  final Color navigationBarColor;
}
