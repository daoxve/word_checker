import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/widgets/add_theme/custom_textfield.dart';

import 'add_theme_viewmodel.dart';

class AddThemeView extends HookWidget {
  const AddThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNameController = useTextEditingController();
    final themeDescController = useTextEditingController();
    final bgColorController = useTextEditingController();
    final accentColorController = useTextEditingController();
    final appbarColorController = useTextEditingController();
    final errorColorController = useTextEditingController();
    final errorAccentColorController = useTextEditingController();
    final textColorController = useTextEditingController();
    final statusBarColorController = useTextEditingController();
    final navBarColorController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();

    return ViewModelBuilder<AddThemeViewModel>.reactive(
      viewModelBuilder: () => AddThemeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: appTheme(context).backgroundColor,
        appBar: CustomAppbar(
          title: 'Add a theme',
          onNavigateBack: () => model.onNavigateBack(context),
          actions: [
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(top: 10),
              icon: const Icon(Icons.help, size: 22),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    CustomTextField(
                      heading: 'Theme Name',
                      isHexCodeField: false,
                      controller: themeNameController,
                      charCount: themeNameController.text.length,
                      onChanged: model.notifyTheListeners,
                      validator: model.nonHexValidator,
                      maxLength: 15,
                    ),
                    Gap.smallH,
                    CustomTextField(
                      heading: 'Theme Description',
                      isHexCodeField: false,
                      controller: themeDescController,
                      charCount: themeDescController.text.length,
                      onChanged: model.notifyTheListeners,
                      validator: model.nonHexValidator,
                      maxLength: 70,
                    ),
                    Gap.smallH,
                    CustomTextField(
                      heading: 'Background color',
                      controller: bgColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 130,
                    ),
                    CustomTextField(
                      heading: 'Accent color',
                      controller: accentColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 100,
                    ),
                    CustomTextField(
                      heading: 'Appbar color',
                      controller: appbarColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 100,
                    ),
                    CustomTextField(
                      heading: 'Error color',
                      controller: errorColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 100,
                    ),
                    CustomTextField(
                      heading: 'Error accent color',
                      controller: errorAccentColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 130,
                    ),
                    CustomTextField(
                      heading: 'Text color',
                      controller: textColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 80,
                    ),
                    CustomTextField(
                      heading: 'Status bar color',
                      controller: statusBarColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                      hexBoxWidth: 130,
                    ),
                    CustomTextField(
                      heading: 'Navigation bar color',
                      controller: navBarColorController,
                      onChanged: model.notifyTheListeners,
                      validator: (String? val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Can\'t be blank either.';
                        }
                        if (val.length != 6) {
                          return 'Not long enough.';
                        }
                        // Return null if it's all good
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              // TODO: Add cool animation for create button
              Padding(
                padding: const EdgeInsets.only(bottom: 36.0),
                child: ElevatedButton(
                  onPressed: () {
                    final bool hasNoErrors = _formKey.currentState?.validate() ?? false;
                    if (hasNoErrors) {
                      model.createTheme(
                        context,
                        themeNameController,
                        themeDescController,
                        bgColorController,
                        accentColorController,
                        appbarColorController,
                        errorColorController,
                        errorAccentColorController,
                        textColorController,
                        statusBarColorController,
                        navBarColorController,
                      );
                    }
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
