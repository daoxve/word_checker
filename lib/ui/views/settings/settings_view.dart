import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/widgets/adjust_textfield_font/custom_labelled_slider.dart';
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
                    onPressed: () => showRadioBottomSheet(
                      context,
                      child: StatefulBuilder(
                        builder: (context, updateState) {
                          return ListView.separated(
                            itemCount: textfieldScrollBehaviours.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            separatorBuilder: (_, __) => SizedBox(
                              height: 1,
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: appTheme(context).colorScheme.background,
                              ),
                            ),
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: RadioListTile<int>(
                                  value: i,
                                  groupValue: model.textFieldScrollBehaviourGroupVal,
                                  onChanged: (val) =>
                                      model.onTFScrollBehaviourRadioChanged(val, updateState),
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  activeColor: appTheme(context).colorScheme.secondary,
                                  title: Text(
                                    textfieldScrollBehaviours[i],
                                    style: appTextTheme(ctx).bodyText1?.copyWith(
                                          color: appTheme(ctx)
                                                      .iconTheme
                                                      .color!
                                                      .computeLuminance() >
                                                  0.5
                                              ? appTheme(context).iconTheme.color
                                              : Colors.black,
                                        ),
                                  ),
                                ),
                              );
                            },
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
                      child: StatefulBuilder(
                        builder: (context, updateState) {
                          return ListView.separated(
                            itemCount: statsBoxBehaviours.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            separatorBuilder: (_, __) => SizedBox(
                              height: 1,
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: appTheme(context).colorScheme.background,
                              ),
                            ),
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: RadioListTile<int>(
                                  value: i,
                                  groupValue: model.statsBoxBehaviourGroupVal,
                                  onChanged: (val) =>
                                      model.onStatsBoxBehaviourChanged(val, updateState),
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  activeColor: appTheme(context).colorScheme.secondary,
                                  title: Text(
                                    statsBoxBehaviours[i],
                                    style: appTextTheme(ctx).bodyText1?.copyWith(
                                          color: appTheme(ctx)
                                                      .iconTheme
                                                      .color!
                                                      .computeLuminance() >
                                                  0.5
                                              ? appTheme(context).iconTheme.color
                                              : Colors.black,
                                        ),
                                  ),
                                ),
                              );
                            },
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
                    onPressed: () => showRadioBottomSheet(
                      context,
                      child: StatefulBuilder(
                        builder: (context, updateState) {
                          return CustomLabelledSlider(
                            heading: 'Set Countdown',
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            headingPadding:  const EdgeInsets.only(top: 16, bottom: 8),
                            sliderValue: model.undoCountdownTime,
                            isPopup: true,
                            onSliderChanged: (i) {
                              updateState(() {
                                model.undoCountdownTime = i;
                              });
                            },
                            maxSliderValue: 50,
                            minSliderValue: 5,
                            intervals: 5,
                            intervalBreaks: 5,
                          );
                        },
                      ),
                    ),
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
