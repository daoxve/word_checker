import 'package:word_checker/core/exports/exports.dart';

class AddThemeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _appThemeService = locator<AppThemeService>();

  void onNavigateBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(milliseconds: 150), () {
      if (FocusScope.of(context).hasFocus == false) {
        _navigationService.back();
      }
    });
  }

  void notifyTheListeners(val) {
    notifyListeners();
  }

  String? nonHexValidator(val) {
    if (val == null || val.trim().isEmpty) {
      return 'This can\'t be blank.';
    }
    if (!RegExp('^[A-Za-z0-9_-]*').hasMatch(val)) {
      return 'Holy moly! No weird symbols please. 😁';
    }
    // Return null if it's all good
    return null;
  }

  void createTheme(
    BuildContext context,
    TextEditingController themeNameController,
    TextEditingController themeDescController,
    TextEditingController bgColorController,
    TextEditingController accentColorController,
    TextEditingController appbarColorController,
    TextEditingController errorColorController,
    TextEditingController errorAccentColorController,
    TextEditingController textColorController,
    TextEditingController statusBarColorController,
    TextEditingController navBarColorController,
  ) {
    _appThemeService.addNewTheme(
      themeNameController.text,
      themeDescController.text,
      ('#' + bgColorController.text).hexToColor(),
      ('#' + accentColorController.text).hexToColor(),
      ('#' + appbarColorController.text).hexToColor(),
      ('#' + errorColorController.text).hexToColor(),
      ('#' + errorAccentColorController.text).hexToColor(),
      ('#' + textColorController.text).hexToColor(),
      ('#' + statusBarColorController.text).hexToColor(),
      ('#' + navBarColorController.text).hexToColor(),
    );

    notifyListeners();
    FocusScope.of(context).unfocus();
    Future.delayed(const Duration(milliseconds: 150), () {
      if (FocusScope.of(context).hasFocus == false) {
        _navigationService.popRepeated(2);
      }
    });
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }
}
