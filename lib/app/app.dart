import 'package:word_checker/exports.dart';

import 'package:word_checker/core/services/app_theme_service.dart';

import 'package:word_checker/ui/views/add_theme/add_theme_view.dart';
import 'package:word_checker/ui/views/home/home_viewmodel.dart';
import 'package:word_checker/ui/views/change_theme/change_theme_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: MainView, initial: true),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: SettingsView),
    CupertinoRoute(page: ChangeThemeView),
    CupertinoRoute(page: AddThemeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: AppThemeService),
    Singleton(classType: HomeViewModel),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
