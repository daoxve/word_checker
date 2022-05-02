import 'package:word_checker/exports.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:word_checker/styles/theme_setup.dart';
import 'package:word_checker/ui/widgets/change_themes/theme_detail_card.dart';

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
            actions: [
              IconButton(
                padding: const EdgeInsets.only(top: 10.0),
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline,size: 22,),
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
                        itemCount: getThemes().length,
                        pageSnapping: false,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (i) {
                          model.toggleRadio(i);
                          getThemeManager(context).selectThemeAtIndex(i);
                        },
                        itemBuilder: (ctx, i) => ThemeDetailCard(
                          innerContainerColor: getThemes()[i].backgroundColor,
                          themeName: model.themesList[i].name,
                          themeDesc: model.themesList[i].desc,
                          radioValue: i,
                          groupValue: model.groupVal,
                          onRadioChanged: (int? value) {
                            model.toggleRadio(value);
                            getThemeManager(context).selectThemeAtIndex(value ?? 0);
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
