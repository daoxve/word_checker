import 'dart:async';

import 'package:word_checker/exports.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('MainViewModel');

  final _navigationService = locator<NavigationService>();
  final textEdController = TextEditingController();

  int wordCount = 0;
  int sentenceCount = 0;
  bool isUndoing = false;
  int undoTimeLeft = 5;
  String? temp;
  TextSelection? _selection;

  // count words
  void onTextFieldChange(String str) {
    final wordRegExp = RegExp(r"\w+(\'\w+)?");
    final sentenceRegExp = RegExp(r'\b[^.!?]+[.!?]+');
    wordCount = wordRegExp.allMatches(str).length;
    sentenceCount = sentenceRegExp.allMatches(str).length;
    notifyListeners();
  }

  // clear selection and start undo timer
  void clearAndStartTimer() {
    if (textEdController.text.isEmpty) return;
    _selection = textEdController.selection; // save cursor location
    temp = textEdController.text;
    textEdController.clear();
    wordCount = 0;
    sentenceCount = 0;
    isUndoing = true;
    notifyListeners();

    Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (undoTimeLeft > 0) {
          undoTimeLeft--;
          notifyListeners();
        } else {
          isUndoing = false;
          undoTimeLeft = 5;
          notifyListeners();
          t.cancel();
        }
      },
    );
  }

  void undo() {
    if (temp == null) return;
    isUndoing = false;
    undoTimeLeft = 0;
    textEdController.text = temp!;
    notifyListeners();

    onTextFieldChange(textEdController.text);
    textEdController.selection = _selection!; // restore last cursor position
    temp = null; // reset temp
    notifyListeners();
  }
}
