import 'package:word_checker/core/exports/exports.dart';

import 'package:word_checker/ui/views/settings/settings_viewmodel.dart';
import '../settings_category_card.dart';

class AboutCategory extends HookViewModelWidget<SettingsViewModel> {
  const AboutCategory({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(context, viewModel) {
    return SettingsCategoryCard(
      heading: 'About',
      buttons: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.star_outline),
          label: Text(
            'Rate our app',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => viewModel.navigateTo(Routes.licenseView),
          icon: const Icon(Icons.info),
          label: Text(
            'License',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => viewModel.navigateTo(Routes.privacyPolicyView),
          icon: const Icon(Icons.privacy_tip),
          label: Text(
            'Privacy Policy',
            style: appTextTheme(context).bodyText2,
          ),
        ),
        TextButton.icon(
          onPressed: () => viewModel.navigateTo(Routes.contactDeveloperView),
          icon: const Icon(Icons.question_answer),
          label: Text(
            'Contact developer',
            style: appTextTheme(context).bodyText2,
          ),
        ),
      ],
    );
  }
}
