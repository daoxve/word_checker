import '../core/exports/exports.dart';

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
    LazySingleton(classType: LookAndFeelService),
    LazySingleton(classType: BasicSettingsService),
    LazySingleton(classType: AboutCategoryService),
    LazySingleton(classType: DangerCategoryService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  //? Serves no purpose besides the annotation attached to it
}
