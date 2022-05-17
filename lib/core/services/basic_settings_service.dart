import 'package:word_checker/core/exports/exports.dart';

class BasicSettingsService {
  final log = getLogger('BasicSettingsService');

  int undoCountdownTime = 5;

  void onUndoCountdownChanged(double i, StateSetter updateState) {
    updateState(() => undoCountdownTime = i.toInt());
  }
}
