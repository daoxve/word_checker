import 'package:word_checker/core/exports/exports.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  bool showPreviousTextOnStart = true;
  bool enableHaptics = true;
  bool snapBetweenThemes = false;

  int behaviour1 = 0;
  int behaviour2 = 1;
  int behaviour3 = 2;
  int textFieldScrollBehaviourGroupVal = 0;

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

  void onBehaviourOneChanged(int? val) {
    if (val != null) textFieldScrollBehaviourGroupVal = val;
    notifyListeners();
  }

  void onBehaviourTwoChanged(int? val) {
    if (val != null) textFieldScrollBehaviourGroupVal = val;
    notifyListeners();
  }

  void onBehaviourThreeChanged(int? val) {
    if (val != null) textFieldScrollBehaviourGroupVal = val;
    notifyListeners();
  }
}
