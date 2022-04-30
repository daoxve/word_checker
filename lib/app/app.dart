import 'package:word_checker/exports.dart';

@StackedApp(
  routes: [
    CustomRoute(page: MainView, initial: true),
    CustomRoute(page: HomeView),
    CustomRoute(page: SettingsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
