import 'dart:ui' as _ui show ImageFilter;

import 'package:word_checker/core/exports/exports.dart';

showChoiceBottomSheet(
  context, {
  required String headingText,
  required String continueButtonText,
  String? cancelButtonText,
  required void Function()? onContinue,
  void Function()? onCancel,
}) {
  final _navService = NavigationService();

  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    builder: (context) => BackdropFilter(
      filter: _ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 160),
          decoration: BoxDecoration(
            color: appTheme(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: DividerTheme(
            data: DividerThemeData(
              color: appTheme(context).iconTheme.color?.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    headingText,
                    style: appTextTheme(context).bodyText1?.copyWith(fontSize: 16),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: onContinue,
                      child: Text(continueButtonText),
                      style: TextButton.styleFrom(
                        primary: appTheme(context).colorScheme.onSecondary,
                      ),
                    ),
                    const Divider(thickness: 1, height: 1),
                    TextButton(
                      onPressed: onCancel ?? _navService.back,
                      child: Text(cancelButtonText ?? 'Cancel'),
                      style: TextButton.styleFrom(
                        primary: appTheme(context).iconTheme.color,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
