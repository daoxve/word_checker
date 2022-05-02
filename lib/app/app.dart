import 'package:word_checker/exports.dart';
import 'package:word_checker/ui/views/home/home_viewmodel.dart';
import 'package:word_checker/ui/views/change_themes/change_themes_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: MainView, initial: true),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: SettingsView),
    CupertinoRoute(page: ChangeThemesView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    Singleton(classType: HomeViewModel),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
