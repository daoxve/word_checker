import 'exports.dart';
import 'package:word_checker/ui/widgets/setup_snackbar_ui.dart';

import 'package:word_checker/styles/theme_setup.dart' as _themes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  setupSnackbarUI();
  await ThemeManager.initialise();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      statusBarColorBuilder: (theme) => theme!.backgroundColor.withOpacity(0.1),
      navigationBarColorBuilder: (theme) => theme!.colorScheme.background,
      defaultThemeMode: ThemeMode.dark,
      themes: _themes.getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Word Checker',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorObservers: [StackedService.routeObserver],
      ),
    );
  }
}
