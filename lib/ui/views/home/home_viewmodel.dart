import 'package:word_checker/exports.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('MainViewModel');

  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final textEdController = TextEditingController();

  int wordCount = 0;
  int sentenceCount = 0;

  // count words
  void onTextFieldChange(String str) {
    final wordRegExp = RegExp(r"\w+(\'\w+)?");
    final sentenceRegExp = RegExp(r'\b[^.!?]+[.!?]+');
    wordCount = wordRegExp.allMatches(str).length;
    sentenceCount = sentenceRegExp.allMatches(str).length;
    notifyListeners();
  }

  void undo() async {
    if (textEdController.text.isEmpty) return;
    String? temp = textEdController.text;
    textEdController.clear();
    wordCount = 0;
    sentenceCount = 0;
    notifyListeners();

    await _snackbarService.showCustomSnackBar(
      message: kOnDeleteText,
      mainButtonTitle: kUndo,
      onMainButtonTapped: () {
        textEdController.text = temp!;
        onTextFieldChange(textEdController.text);
        temp = null;
        _navigationService.back(); // Dismiss the snackbar
        notifyListeners();
      },
      onTap: () {},
      variant: SnackbarType.undo,
      duration: const Duration(seconds: 2),
    );
  }
}
