import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:word_checker/exports.dart';
import 'package:word_checker/ui/widgets/settings/setting_card.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('Settings'),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                thickness: 1.3,
              ),
            ),
            elevation: 0,
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingCard(
                heading: 'Look & feel',
                iconsBuilder: const [
                  Icons.palette,
                  Icons.format_size,
                  Icons.abc,
                ],
                buttonsBuilder: () => {
                  'Change Theme': () {
                    print('one was pressed');
                  },
                  'Adjust Text Font': () {
                    print('two was pressed');
                    return true;
                  },
                  'Textfield Behavior': () {
                    print('three was pressed');
                  },
                },
              ),
              SettingCard(
                heading: 'Basic Settings',
                iconsBuilder: const [
                  Icons.palette,
                  Icons.format_size,
                  Icons.abc,
                ],
                buttonsBuilder: () => {
                  'Change Theme': () {
                    print('one was pressed');
                  },
                  'Adjust Text Font': () {
                    print('two was pressed');
                  },
                  'Textfield Behavior': () {
                    print('three was pressed');
                  },
                },
              ),
              SettingCard(
                heading: 'About',
                iconsBuilder: const [
                  Icons.info,
                  Icons.privacy_tip,
                  Icons.help,
                ],
                buttonsBuilder: () => {
                  'License': () {
                    print('license was pressed');
                  },
                  'Privacy Policy': () {
                    print('two was pressed');
                  },
                  'Version': () {
                    print('three was pressed');
                  },
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
