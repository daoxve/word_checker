import 'package:word_checker/core/exports/exports.dart';

@Deprecated('Use the appThemes variable from AppThemeService')
///A static reference to appwide themes
List<ThemeData> getThemes() {
  final _themes = [
    // Light
    ThemeData(
      backgroundColor: kcWhite,
      canvasColor: kcWhite,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: kcBlue,
        onSecondary: kcBlack,
        primaryContainer: kcLightVar,
        secondaryContainer: kcWhite.withOpacity(0.2),
        background: kcWhiteBackground,
        brightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(color: kcBlack),
      appBarTheme: const AppBarTheme(
        backgroundColor: kcWhite,
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

    // Dim
    ThemeData(
      backgroundColor: kcDark,
      canvasColor: kcDark,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: kcBlue,
        onSecondary: kcWhite,
        primaryContainer: kcDarkVar,
        secondaryContainer: Colors.transparent,
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
      appBarTheme: const AppBarTheme(
        backgroundColor: kcDark,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      hintColor: Colors.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    ),

    // Lights out
    ThemeData(
      backgroundColor: kcBlack,
      canvasColor: kcBlack,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: kcBlue,
        onSecondary: kcWhite,
        primaryContainer: kcDarkVar,
        secondaryContainer: kcBlack.withOpacity(0.02),
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
      appBarTheme: const AppBarTheme(
        backgroundColor: kcBlack,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      hintColor: Colors.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    ),
  ];

  return _themes;
}
