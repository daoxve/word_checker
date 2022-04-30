import 'package:word_checker/exports.dart';

/// This function initializes all snackbars to be used later in the app.
void setupSnackbarUI() {
  final service = locator<SnackbarService>();

  // Mobile
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.undo,
    config: SnackbarConfig(
      messageTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
      mainButtonStyle: TextButton.styleFrom(
        primary: kcError,
        backgroundColor: kcError.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: const Icon(
        Icons.error_outline,
        size: 35.0,
        color: kcError,
      ),
      backgroundColor: kcErrorAccent,
      mainButtonTextColor: kcError,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      dismissDirection: DismissDirection.horizontal,
      instantInit: true,
      borderRadius: 15,
      overlayBlur: 0.1,
      overlayColor: Colors.black26,
      shouldIconPulse: false,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
    ),
  );

}
