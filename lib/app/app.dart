import '../core/exports/exports.dart';
import 'package:word_checker/ui/views/home/home_viewmodel.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: MainView, initial: true),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: SettingsView),
    CupertinoRoute(page: ChangeThemeView),
    CupertinoRoute(page: AddThemeView),
    CupertinoRoute(page: AdjustTextfieldFontView),
    CupertinoRoute(page: LicenseView),
    CupertinoRoute(page: PrivacyPolicyView),
    CupertinoRoute(page: ContactDeveloperView),
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
