import 'package:word_checker/exports.dart';

class ThemeDialogViewModel extends BaseViewModel {
  ThemeRadio? groupVal = ThemeRadio.none;
  ThemeRadio? radioOneVal = ThemeRadio.classic;
  ThemeRadio? radioTwoVal = ThemeRadio.dim;
  ThemeRadio? radioThreeVal = ThemeRadio.lightsOut;

  void toggleRadio(ThemeRadio? value) {
    groupVal = value;
    notifyListeners();
  }

  void getSelectedTheme(BuildContext context) {
    if (getThemeManager(context).selectedThemeIndex == 0) {
      groupVal = ThemeRadio.classic;
    } else if (getThemeManager(context).selectedThemeIndex == 1) {
      groupVal = ThemeRadio.dim;
    } else if (getThemeManager(context).selectedThemeIndex == 2) {
      groupVal = ThemeRadio.lightsOut;
    }
  }
}
