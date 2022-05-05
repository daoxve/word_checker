import 'package:word_checker/core/exports/exports.dart';

class ChangeThemeViewModel extends BaseViewModel {
  final log = getLogger('ChangeThemeViewModel');
  final _navigationService = locator<NavigationService>();
  final _appThemesService = locator<AppThemeService>();

  void Function() get generateThemesList => _appThemesService.generateThemesList;
  List<ThemeDetailModel> get themesList => _appThemesService.themesList;
  List<ThemeData> get appThemes => _appThemesService.appThemes;

  int? groupVal;

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  void toggleRadio(int? value) {
    groupVal = value;
    notifyListeners();
  }

  void setGroupVal(context) {
    groupVal = getThemeManager(context).selectedThemeIndex;
  }
}
