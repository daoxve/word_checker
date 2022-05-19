import 'package:word_checker/core/exports/exports.dart';
import 'package:word_checker/ui/widgets/change_theme/theme_detail_card.dart';

import 'change_theme_viewmodel.dart';

class ChangeThemeView extends HookWidget {
  const ChangeThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController(
      initialPage: getThemeManager(context).selectedThemeIndex ?? 0,
    );

    return ViewModelBuilder<ChangeThemeViewModel>.reactive(
      onModelReady: (model) {
        model.generateThemesList();
        model.setGroupVal(context);
      },
      viewModelBuilder: () => ChangeThemeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: appTheme(context).backgroundColor,
          appBar: CustomAppbar(
            title: 'Change Theme',
            actions: [
              IconButton(
                padding: const EdgeInsets.only(top: 10.0),
                onPressed: () => model.navigateTo(Routes.addThemeView),
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 22,
                ),
              )
            ],
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
                        itemCount: model.appThemes.length,
                        // pageSnapping: false,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (i) {
                          model.toggleRadio(i);
                          getThemeManager(context).selectThemeAtIndex(i);
                        },
                        itemBuilder: (ctx, i) => ThemeDetailCard(
                          innerContainerColor:
                              model.appThemes[i].backgroundColor,
                          themeName: model.themesList[i].name,
                          themeDesc: model.themesList[i].desc,
                          radioValue: i,
                          groupValue: model.groupVal,
                          onRadioChanged: (int? value) {
                            model.toggleRadio(value);
                            getThemeManager(context)
                                .selectThemeAtIndex(value ?? 0);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Dot button
              SmoothPageIndicator(
                controller: _pageController,
                count: model.appThemes.length,
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                },
                effect: SlideEffect(
                  activeDotColor: appTheme(context).colorScheme.secondary,
                  dotColor:
                      appTheme(context).colorScheme.secondary.withOpacity(0.2),
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
