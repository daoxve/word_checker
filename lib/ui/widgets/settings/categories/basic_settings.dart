import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/widgets/adjust_textfield_font/custom_labelled_slider.dart';
import 'package:word_checker/ui/widgets/settings/switch_tile.dart';

import 'package:word_checker/ui/views/settings/settings_viewmodel.dart';
import '../settings_category_card.dart';

class BasicSettings extends HookViewModelWidget<SettingsViewModel> {
  const BasicSettings({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(context, viewModel) {
    return SettingsCategoryCard(
      heading: 'Basic Settings',
      buttons: [
        SwitchTile(
          icon: Icons.save,
          label: 'Show last entered text on restart',
          switchValue: viewModel.showPreviousTextOnStart,
          onSwitchChanged: viewModel.toggleShowPrevText,
        ),
        TextButton.icon(
          onPressed: () => showRadioBottomSheet(
            context,
            child: StatefulBuilder(
              builder: (context, updateState) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 36.0, top: 18),
                  child: CustomLabelledSlider(
                    heading: 'Set Countdown',
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    headingPadding: const EdgeInsets.only(top: 16, bottom: 8),
                    sliderValue: viewModel.undoCountdownTime,
                    isPopup: true,
                    onSliderChanged: (i) {
                      updateState(() {
                        viewModel.undoCountdownTime = i;
                      });
                    },
                    maxSliderValue: 50,
                    minSliderValue: 5,
                    intervals: 5,
                    intervalBreaks: 5,
                  ),
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
          switchValue: viewModel.enableHaptics,
          onSwitchChanged: viewModel.toggleHaptics,
        ),
        SwitchTile(
          icon: Icons.donut_large,
          label: 'Snap between themes',
          switchValue: viewModel.snapBetweenThemes,
          onSwitchChanged: viewModel.toggleSnapThemes,
        ),
      ],
    );
  }
}
