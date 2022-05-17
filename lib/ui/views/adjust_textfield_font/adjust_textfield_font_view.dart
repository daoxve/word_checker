import 'package:word_checker/core/exports/exports.dart';

import '../../widgets/adjust_textfield_font/lorem_textfield.dart';
import '../../widgets/adjust_textfield_font/custom_labelled_slider.dart';

import 'adjust_textfield_font_viewmodel.dart';

class AdjustTextfieldFontView extends StatelessWidget {
  const AdjustTextfieldFontView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdjustTextfieldFontViewModel>.reactive(
      viewModelBuilder: () => AdjustTextfieldFontViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppbar(
          title: 'Adjust Textfield Font',
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            LoremTextField(
              fontSize: model.textSize,
              wordSpacing: model.wordSpacing,
              letterSpacing: model.letterSpacing,
              lineHeight: model.lineSpacing,
            ),
            SlidingUpPanel(
              backdropEnabled: true,
              parallaxEnabled: true,
              color: appTheme(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              minHeight: 370,
              panel: Card(
                color: appTheme(context).colorScheme.background,
                child: Column(
                  children: [
                    Notch(
                      color: appTheme(context).iconTheme.color?.withOpacity(0.4),
                    ),
                    CustomLabelledSlider(
                      heading: 'Text size',
                      sliderValue: model.textSize,
                      onSliderChanged: model.onTextSizeChanged,
                      maxSliderValue: 30,
                      minSliderValue: 10,
                      intervals: 5,
                      intervalBreaks: 2.5,
                    ),
                    CustomLabelledSlider(
                      heading: 'Letter spacing',
                      sliderValue: model.letterSpacing,
                      onSliderChanged: model.onLetterSpacingChanged,
                      minSliderValue: 1,
                      maxSliderValue: 10,
                      intervals: 1,
                      // intervalBreaks: 0.8,
                    ),
                    CustomLabelledSlider(
                      heading: 'Word spacing',
                      sliderValue: model.wordSpacing,
                      onSliderChanged: model.onWordSpacingChanged,
                      minSliderValue: 1,
                      maxSliderValue: 10,
                      intervals: 1,
                      // intervalBreaks: 2.5,
                    ),
                    CustomLabelledSlider(
                      heading: 'Line height',
                      sliderValue: model.lineSpacing,
                      onSliderChanged: model.onLineSpacingChanged,
                      minSliderValue: 0.5,
                      maxSliderValue: 2.0,
                      // intervals: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
