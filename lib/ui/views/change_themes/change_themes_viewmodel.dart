import 'package:word_checker/exports.dart';
import 'package:word_checker/styles/theme_setup.dart';

class ChangeThemesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final log = getLogger('ChangeThemesViewModel');

  int? groupVal;

  List<ThemeDetailModel> themesList = [];
  final Map<String, String> defaultThemes = {
    'Classic White': 'The default experience. So why change it?',
    'Dimmed Dark': 'A little darker.',
    'Black': 'For the darkest of days.',
  };

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  void generateThemesList() {
    themesList.clear();
    getThemes().forEachIndexed(
      (i, theme) {
        themesList.add(
          ThemeDetailModel(
            name: defaultThemes.keys.elementAt(i),
            desc: defaultThemes.values.elementAt(i),
            backgroundColor: theme.backgroundColor,
          ),
        );
      },
    );
  }

  void toggleRadio(int? value) {
    groupVal = value;
    notifyListeners();
  }

  void setGroupVal(context) {
    groupVal = getThemeManager(context).selectedThemeIndex;
  }
}

class ThemeDetailModel {
  ThemeDetailModel({
    required this.name,
    required this.desc,
    required this.backgroundColor,
  });

  final String name;
  final String desc;
  final Color backgroundColor;
}
