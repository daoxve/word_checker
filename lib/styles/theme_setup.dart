import 'package:flutter/services.dart';
import 'package:word_checker/exports.dart';

List<ThemeData> getThemes() {
  return [
    ThemeData(
      backgroundColor: kcWhite,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: kcBlack12,
        onSecondary: kcBlack,
        primaryContainer: kcLightVar,
        secondaryContainer: kcLightVarAccent,
        background: kcWhiteBackground,
        brightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(color: kcBlack),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      textTheme: TextTheme(
        headline1: kHeadline1.copyWith(color: kcBlack),
        headline2: kHeadline2.copyWith(color: kcBlack),
        headline6: kHeadline6.copyWith(color: kcBlack),
        subtitle1: kSubtitle1.copyWith(color: kcGrey),
        subtitle2: kSubtitle2.copyWith(color: kcBlack54),
      ),
      hintColor: Colors.black,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    ),
    ThemeData(
      backgroundColor: kcDark,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: kcDarkAccent,
        onSecondary: kcWhite,
        primaryContainer: kcDarkVar,
        secondaryContainer: kcDarkVarAccent,
        background: kcDarkAccent,
        brightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(color: kcWhite),
      textTheme: TextTheme(
        headline1: kHeadline1.copyWith(color: kcWhite),
        headline2: kHeadline2.copyWith(color: kcWhite),
        headline6: kHeadline6.copyWith(color: kcWhite),
        subtitle1: kSubtitle1.copyWith(color: kcWhite),
        subtitle2: kSubtitle2.copyWith(color: kcWhite54),
      ),
      hintColor: Colors.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    ),
    ThemeData(
      backgroundColor: Colors.white,
      accentColor: Colors.green,
    ),
    ThemeData(
      backgroundColor: Colors.purple,
      accentColor: Colors.green,
    ),
    ThemeData(
      backgroundColor: Colors.black,
      accentColor: Colors.red,
    ),
    ThemeData(
      backgroundColor: Colors.red,
      accentColor: Colors.blue,
    ),
  ];
}
