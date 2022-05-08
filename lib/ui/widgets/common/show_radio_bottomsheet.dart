import 'dart:ui' as _ui show ImageFilter;

import 'package:word_checker/core/exports/exports.dart';

showRadioBottomSheet(
  context, {
  required Widget child,
}) {
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
            child: child,
          ),
        ),
      ),
    ),
  );
}
