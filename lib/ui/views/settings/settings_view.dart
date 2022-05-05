import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/widgets/settings/settings_category_card.dart';
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
              SettingsCategoryCard(
                heading: 'Look & feel',
                buttons: [
                  TextButton.icon(
                    onPressed: () => model.navigateTo(Routes.changeThemeView),
                    icon: const Icon(Icons.palette),
                    label: Text(
                      'Change Theme',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => model.navigateTo(Routes.adjustTextfieldFontView),
                    icon: const Icon(Icons.format_size),
                    label: Text(
                      'Adjust Textfield Font',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.drag_handle),
                    label: Text(
                      'Textfield Scroll Behavior',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.line_style),
                    label: Text(
                      'Stats Box Behaviour',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                ],
              ),
              SettingsCategoryCard(
                heading: 'Basic Settings',
                buttons: [
                  SwitchTile(
                    icon: Icons.save,
                    label: 'Show last entered text on restart',
                    switchValue: model.showPreviousTextOnStart,
                    onSwitchChanged: model.toggleShowPrevText,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.timer),
                    label: Text(
                      'Change Undo Countdown Time',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  SwitchTile(
                    icon: Icons.vibration,
                    label: 'Enable haptic feedback',
                    switchValue: model.enableHaptics,
                    onSwitchChanged: model.toggleHaptics,
                  ),
                  SwitchTile(
                    icon: Icons.donut_large,
                    label: 'Snap between themes',
                    switchValue: model.snapBetweenThemes,
                    onSwitchChanged: model.toggleSnapThemes,
                  ),
                ],
              ),
              SettingsCategoryCard(
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
                ],
              ),
              SettingsCategoryCard(
                heading: 'Danger',
                headingIcon: Icons.help,
                subHeading: 'Most settings here are irreversible',
                isErrorCard: true,
                headingColor: kcError,
                buttons: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cleaning_services_outlined,
                    ),
                    label: Text(
                      'Clear app cache',
                      style: appTextTheme(context).bodyText2,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
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
              ),
              Align(
                child: Text(
                  'App Version - 1.0.0',
                  style: appTextTheme(context).bodySmall,
                ),
              ),
              Gap.mediumH,
            ],
          ),
        ),
      ),
    );
  }
}
