import 'package:word_checker/core/exports/exports.dart';

import 'package:word_checker/ui/views/settings/settings_viewmodel.dart';
import '../../common/show_choice_bottomsheet.dart';
import '../settings_category_card.dart';

class DangerCategory extends HookViewModelWidget<SettingsViewModel> {
  const DangerCategory({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(context, viewModel) {
    return SettingsCategoryCard(
      heading: 'Danger',
      headingIcon: Icons.help,
      subHeading: 'Most settings here are irreversible',
      isErrorCard: true,
      headingColor: kcError,
      buttons: [
        TextButton.icon(
          onPressed: () => showChoiceBottomSheet(
            context,
            headingText: 'Continue to clear app cache?',
            continueButtonText: 'Clear',
            onContinue: () {},
          ),
          icon: const Icon(
            Icons.cleaning_services_outlined,
          ),
          label: Text(
            'Clear app cache',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => showChoiceBottomSheet(
            context,
            headingText: 'Continue to reset to defaults?',
            continueButtonText: 'Restore defaults',
            onContinue: () {},
          ),
          icon: const Icon(Icons.settings_backup_restore),
          label: Text(
            'Restore app defaults',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        // TextButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(Icons.gamepad_sharp),
        //   label: Text(
        //     'Switch custom renderer',
        //     style: appTextTheme(context).bodyText2,
        //   ),
        // ),
      ],
    );
  }
}
