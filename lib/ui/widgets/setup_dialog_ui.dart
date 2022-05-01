import 'package:word_checker/exports.dart';

import '../views/dialogs/theme/theme_dialog_view.dart';

void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.theme: (context, sheetRequest, completer) =>
        ThemeDialogView(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
