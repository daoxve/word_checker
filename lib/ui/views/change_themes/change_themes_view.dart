import 'package:word_checker/exports.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:word_checker/styles/theme_setup.dart';

import 'change_themes_viewmodel.dart';

class ChangeThemesView extends HookWidget {
  const ChangeThemesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController(
      initialPage: getThemeManager(context).selectedThemeIndex ?? 0,
    );

    return ViewModelBuilder<ChangeThemesViewModel>.reactive(
      onModelReady: (model) {
        model.generateThemesList();
        model.setGroupVal(context);
      },
      viewModelBuilder: () => ChangeThemesViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: appTheme(context).backgroundColor,
          appBar: CustomAppbar(
            title: 'Change Theme',
            onTap: model.navigateBack,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Page view
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: getThemes().length,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (i) {
                          model.toggleRadio(i);
                          getThemeManager(context).selectThemeAtIndex(i);
                        },
                        itemBuilder: (ctx, i) => Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(40),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: appTheme(context).colorScheme.secondary,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: appTheme(context).backgroundColor,
                                        width: 10,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color: getThemes()[i].backgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                model.themesList[i].name,
                                style: appTextTheme(context).headline2,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                model.themesList[i].desc,
                                style: appTextTheme(context).bodyText2,
                              ),
                              Radio<int?>(
                                value: i,
                                groupValue: model.groupVal,
                                activeColor: appTheme(context).colorScheme.secondary,
                                onChanged: (int? value) {
                                  model.toggleRadio(value);
                                  getThemeManager(context).selectThemeAtIndex(value ?? 0);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Dot button
              SmoothPageIndicator(
                controller: _pageController,
                count: getThemes().length,
                effect: SlideEffect(
                  activeDotColor: appTheme(context).colorScheme.secondary,
                  dotColor: appTheme(context).colorScheme.secondary.withOpacity(0.2),
                  dotHeight: 10,
                  dotWidth: 20,
                  spacing: 16,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
