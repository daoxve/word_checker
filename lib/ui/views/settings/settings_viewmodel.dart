import 'package:word_checker/exports.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

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
