import 'package:word_checker/exports.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool showPreviousTextOnStart = true;
  bool enableHaptics = true;
  bool snapBetweenThemes = false;

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  void changeThemeFunc() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.theme,
      barrierDismissible: true,
    );
  }

  void toggleShowPrevText(bool val) {
    showPreviousTextOnStart = !showPreviousTextOnStart;
    notifyListeners();
  }

  void toggleHaptics(val) {
    enableHaptics = !enableHaptics;
    notifyListeners();
  }

  void toggleSnapThemes(val) {
    snapBetweenThemes = !snapBetweenThemes;
    notifyListeners();
  }
}
