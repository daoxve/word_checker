import 'package:word_checker/exports.dart';
import 'package:word_checker/ui/widgets/settings/setting_card.dart';
import 'package:word_checker/ui/widgets/settings/switch_tile.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: appTheme(context).backgroundColor,
        appBar: const CustomAppbar(title: 'Settings'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 4),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingCard(
                heading: 'Look & feel',
                buttons: [
                  TextButton.icon(
                    onPressed: () => model.navigateTo(Routes.changeThemesView),
                    icon: const Icon(Icons.palette),
                    label: Text(
                      'Change Theme',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.format_size),
                    label: Text(
                      'Adjust Text Font',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.abc),
                    label: Text(
                      'Textfield Behavior',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                ],
              ),
              SettingCard(
                heading: 'Basic Settings',
                buttons: [
                  SwitchTile(
                    icon: Icons.save,
                    label: 'Display previous text on start',
                    switchValue: model.displayPreviousTextOnStart,
                    onSwitchChanged: model.dispPrevTextOnStartToggle,
                  ),
                ],
              ),
              SettingCard(
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
                    onPressed: () {},
                    icon: const Icon(Icons.info),
                    label: Text(
                      'License',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.question_answer),
                    label: Text(
                      'FAQ',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.privacy_tip),
                    label: Text(
                      'Privacy Policy',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.help),
                    label: Text(
                      'Version',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
