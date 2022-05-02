import 'package:word_checker/exports.dart';
import 'package:word_checker/ui/views/home/home_viewmodel.dart';
import 'package:word_checker/ui/views/change_themes/change_themes_view.dart';

@StackedApp(
  routes: [
    CustomRoute(page: MainView, initial: true),
    CustomRoute(page: HomeView),
    CustomRoute(page: SettingsView),
    CustomRoute(page: ChangeThemesView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    Singleton(classType: HomeViewModel),
    Singleton(classType: ThemeService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
