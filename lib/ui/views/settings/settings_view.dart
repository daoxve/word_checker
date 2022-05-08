import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/widgets/settings/categories/about_category.dart';
import 'package:word_checker/ui/widgets/settings/categories/basic_settings.dart';
import 'package:word_checker/ui/widgets/settings/categories/danger_category.dart';

// Parts
import 'package:word_checker/ui/widgets/settings/categories/look_and_feel.dart';

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
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LookAndFeel(),
                const BasicSettings(),
                const AboutCategory(),
                const DangerCategory(),
                Center(
                  child: Text(
                    appVersionInfo,
                    style: appTextTheme(context).bodySmall,
                  ),
                ),
                Gap.mediumH,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
