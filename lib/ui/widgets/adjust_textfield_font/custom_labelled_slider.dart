import 'package:word_checker/core/exports/exports.dart';

class CustomLabelledSlider extends StatelessWidget {
  const CustomLabelledSlider({
    Key? key,
    required this.heading,
    this.sliderValue,
    this.minSliderValue,
    this.maxSliderValue,
    this.intervals,
    this.intervalBreaks,
    this.onSliderChanged,
    this.isPopup = false,
    this.padding,
    this.headingPadding,
  }) : super(key: key);

  final String heading;
  final double? sliderValue;
  final double? minSliderValue;
  final double? maxSliderValue;
  final double? intervals;
  final double? intervalBreaks;
  final void Function(dynamic)? onSliderChanged;
  final bool isPopup;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? headingPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        mainAxisSize: isPopup ? MainAxisSize.min : MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: headingPadding ?? const EdgeInsets.only(top: 16),
            child: Text(
              heading,
              style: appTextTheme(context).headline2,
            ),
          ),
          SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackHeight: 2,
              inactiveTrackHeight: 1,
              activeTickColor: appTheme(context).iconTheme.color,
              activeMinorTickColor: appTheme(context).iconTheme.color,
              inactiveTickColor: appTheme(context).iconTheme.color,
              inactiveMinorTickColor: appTheme(context).iconTheme.color,
              disabledActiveMinorTickColor: appTheme(context).iconTheme.color,
              disabledActiveTickColor: appTheme(context).iconTheme.color,
              disabledInactiveTickColor: appTheme(context).iconTheme.color,
              disabledInactiveMinorTickColor: appTheme(context).iconTheme.color,
            ),
            child: SfSlider(
              min: minSliderValue ?? 0,
              max: maxSliderValue ?? 10.0,
              value: sliderValue ?? 3,
              interval: intervals,
              stepSize: intervalBreaks,
              showTicks: true,
              showLabels: true,
              minorTicksPerInterval: 1,
              onChanged: onSliderChanged,
            ),
          ),
        ],
      ),
    );
  }
}
