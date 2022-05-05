import 'package:word_checker/core/exports/exports.dart';

class AppThemeService {
  final log = getLogger('AppThemeService');
  List<ThemeData> get appThemes => _appThemes;

  final _appThemes = [
    // Light
    ThemeData(
      backgroundColor: kcWhite,
      canvasColor: kcWhite,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: kcBlue,
        onSecondary: kcError,
        primaryContainer: kcWhite.withOpacity(0.2),
        secondaryContainer: kcErrorAccent,
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
        onSecondary: kcError,
        primaryContainer: Colors.transparent,
        secondaryContainer: kcErrorAccent,
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
        onSecondary: kcError,
        primaryContainer: kcBlack.withOpacity(0.02),
        secondaryContainer: kcErrorAccent,
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

  final Map<String, String> defaultAppThemes = {
    'Classic White': 'The default experience. So why change it?',
    'Dimmed Dark': 'A little darker.',
    'Black': 'For the darkest of days.',
  };
  List<ThemeDetailModel> themesList = [];

  void generateThemesList() {
    themesList.clear();
    _appThemes.forEachIndexed((i, theme) {
      themesList.add(
        ThemeDetailModel(
          name: defaultAppThemes.keys.elementAt(i),
          desc: defaultAppThemes.values.elementAt(i),
          backgroundColor: theme.backgroundColor,
          accentColor: theme.colorScheme.secondary,
          errorColor: theme.colorScheme.onSecondary,
          errorAccentColor: theme.colorScheme.secondaryContainer,
          appbarColor: theme.appBarTheme.backgroundColor ?? Colors.transparent,
          textColor: theme.iconTheme.color ?? Colors.white,
          statusBarColor: theme.colorScheme.primaryContainer,
          navigationBarColor: theme.canvasColor,
        ),
      );
    });
  }

  void addNewTheme(
    String themeName,
    String themeDesc,
    Color backgroundColor,
    Color accentColor,
    Color appbarColor,
    Color errorColor,
    Color errorAccentColor,
    Color textColor,
    Color statusBarColor,
    Color navigationBarColor,
  ) {
    defaultAppThemes[themeName] = themeDesc;
    log.i(defaultAppThemes.entries);
    _appThemes.add(
      ThemeData(
        backgroundColor: backgroundColor,
        canvasColor: navigationBarColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: accentColor,
          onSecondary: errorColor,
          primaryContainer: statusBarColor,
          secondaryContainer: errorAccentColor,
          background: kcDarkAccent,
          brightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: textColor),
        textTheme: TextTheme(
          headline1: kHeadline1.copyWith(color: textColor),
          headline2: kHeadline2.copyWith(color: textColor),
          headline6: kHeadline6.copyWith(color: textColor),
          subtitle1: kSubtitle1.copyWith(color: textColor),
          subtitle2: kSubtitle2.copyWith(color: textColor.withOpacity(0.5)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: appbarColor,
          titleTextStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        hintColor: textColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
    generateThemesList();
  }
}
