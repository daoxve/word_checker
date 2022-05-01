import 'package:word_checker/exports.dart';

import 'theme_dialog_viewmodel.dart';

class ThemeDialogView extends StatelessWidget {
  const ThemeDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeDialogViewModel>.reactive(
      onModelReady: (model) => model.getSelectedTheme(context),
      viewModelBuilder: () => ThemeDialogViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: _ThemeDialogContent(
          request: request!,
          completer: completer!,
          model: model,
        ),
      ),
    );
  }
}

class _ThemeDialogContent extends StatelessWidget {
  const _ThemeDialogContent({
    Key? key,
    required this.request,
    required this.completer,
    required this.model,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse) completer;
  final ThemeDialogViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme(context).backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Theme',
            style: appTextTheme(context).bodyLarge,
          ),

          // Radio 1
          RadioListTile<ThemeRadio?>(
            value: model.radioOneVal,
            groupValue: model.groupVal,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Classic',
              style: appTextTheme(context).bodyText2,
            ),
            onChanged: (ThemeRadio? value) {
              model.toggleRadio(value);
              getThemeManager(context).selectThemeAtIndex(value?.index ?? 0);
            },
          ),

          // Radio 2
          RadioListTile<ThemeRadio?>(
            value: model.radioTwoVal,
            groupValue: model.groupVal,
            activeColor: appTheme(context).colorScheme.secondary,
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Dim',
              style: appTextTheme(context).bodyText2,
            ),
            onChanged: (ThemeRadio? value) {
              model.toggleRadio(value);
              getThemeManager(context).selectThemeAtIndex(value?.index ?? 1);
            },
          ),

          // Radio 3
          RadioListTile<ThemeRadio?>(
            value: model.radioThreeVal,
            groupValue: model.groupVal,
            contentPadding: EdgeInsets.zero,
            activeColor: appTheme(context).colorScheme.secondary,
            title: Text(
              'Lights out',
              style: appTextTheme(context).bodyText2,
            ),
            onChanged: (ThemeRadio? value) {
              model.toggleRadio(value);
              getThemeManager(context).selectThemeAtIndex(value?.index ?? 2);
            },
          ),
        ],
      ),
    );
  }
}
