import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/views/settings/settings_viewmodel.dart';

import '../settings_category_card.dart';

class LookAndFeel extends HookViewModelWidget<SettingsViewModel> {
  const LookAndFeel({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(context, viewModel) {
    return SettingsCategoryCard(
      heading: 'Look & feel',
      buttons: [
        TextButton.icon(
          onPressed: () => viewModel.navigateTo(Routes.changeThemeView),
          icon: const Icon(Icons.palette),
          label: Text(
            'Change Theme',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => viewModel.navigateTo(Routes.adjustTextfieldFontView),
          icon: const Icon(Icons.format_size),
          label: Text(
            'Adjust Textfield Font',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => showRadioBottomSheet(
            context,
            child: ListView.separated(
              itemCount: textfieldScrollBehaviours.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1),
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RadioListTile<int>(
                    value: i,
                    groupValue: viewModel.textFieldScrollBehaviourGroupVal,
                    onChanged: viewModel.onTFScrollBehaviourRadioChanged,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: appTheme(context).colorScheme.secondary,
                    title: Text(
                      textfieldScrollBehaviours[i],
                      style: appTextTheme(ctx).bodyText1?.copyWith(
                            color: appTheme(ctx).iconTheme.color!.computeLuminance() > 0.5
                                ? appTheme(context).iconTheme.color
                                : Colors.black,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
          icon: const Icon(Icons.drag_handle),
          label: Text(
            'Textfield Scroll Behavior',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => showRadioBottomSheet(
            context,
            child: ListView.separated(
              itemCount: statsBoxBehaviours.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1),
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RadioListTile<int>(
                    value: i,
                    groupValue: viewModel.statsBoxBehaviourGroupVal,
                    onChanged: viewModel.onStatsBoxBehaviourChanged,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: appTheme(context).colorScheme.secondary,
                    title: Text(
                      statsBoxBehaviours[i],
                      style: appTextTheme(ctx).bodyText1?.copyWith(
                            color: appTheme(ctx).iconTheme.color!.computeLuminance() > 0.5
                                ? appTheme(context).iconTheme.color
                                : Colors.black,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
          icon: const Icon(Icons.line_style),
          label: Text(
            'Stats Box Behaviour',
            style: appTextTheme(context).bodyText2,
          ),
        ),
      ],
    );
  }
}
