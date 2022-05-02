import 'package:word_checker/exports.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  bool displayPreviousTextOnStart = true;

  void changeThemeFunc() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.theme,
      barrierDismissible: true,
    );
  }

  void dispPrevTextOnStartToggle(bool newVal) {
    displayPreviousTextOnStart = !displayPreviousTextOnStart;
    notifyListeners();
  }
}
