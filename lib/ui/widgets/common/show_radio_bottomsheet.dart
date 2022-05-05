import 'dart:ui' as _ui show ImageFilter;

import 'package:word_checker/core/exports/exports.dart';

showRadioBottomSheet(
  context, {
  required Widget child,
}) {
  return showCupertinoModalPopup(
    context: context,
    filter: _ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
    builder: (context) => Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: appTheme(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: child,
      ),
    ),
  );
}
