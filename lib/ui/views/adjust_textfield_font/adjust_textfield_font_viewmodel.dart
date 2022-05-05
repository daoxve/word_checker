import 'package:word_checker/core/exports/exports.dart';

class AdjustTextfieldFontViewModel extends BaseViewModel {
  double textSize = 15;
  double letterSpacing = 1;
  double wordSpacing = 1;
  double lineSpacing = 1;

  void onTextSizeChanged(val) {
    textSize = val;
    notifyListeners();
  }

  void onLetterSpacingChanged(val) {
    letterSpacing = val;
    notifyListeners();
  }

  void onWordSpacingChanged(val) {
    wordSpacing = val;
    notifyListeners();
  }

  void onLineSpacingChanged(val) {
    lineSpacing = val;
    notifyListeners();
  }
}
