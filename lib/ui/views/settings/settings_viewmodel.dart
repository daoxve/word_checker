import 'package:word_checker/core/exports/exports.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool showPreviousTextOnStart = true;
  bool enableHaptics = true;
  bool snapBetweenThemes = false;

  int textFieldScrollBehaviourGroupVal = 0;
  int statsBoxBehaviourGroupVal = 0;
  double undoCountdownTime = 5;

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

  void onTFScrollBehaviourRadioChanged(int? val) {
    if (val != null) textFieldScrollBehaviourGroupVal = val;
    _navigationService.back();
    notifyListeners();
  }

  void onStatsBoxBehaviourChanged(int? val) {
    if (val != null) statsBoxBehaviourGroupVal = val;
    _navigationService.back();
    notifyListeners();
  }
}
