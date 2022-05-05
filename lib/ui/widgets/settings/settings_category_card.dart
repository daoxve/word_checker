import 'package:word_checker/core/exports/exports.dart';

/// A card with a dynamically adjusting number of buttons
class SettingsCategoryCard extends StatelessWidget {
  const SettingsCategoryCard({
    Key? key,
    this.heading,
    this.subHeading,
    this.headingColor,
    this.headingIcon,
    this.isErrorCard = false,
    required this.buttons,
  }) : super(key: key);

  /// Title of this [SettingsCategoryCard].
  /// Can optionally be null
  final String? heading;
  final String? subHeading;
  final bool isErrorCard;
  final IconData? headingIcon;

  final Color? headingColor;

  /// Body of this [SettingsCategoryCard]
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        color: appTheme(context).backgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: heading != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      heading ?? 'Heading',
                      style: appTextTheme(context).headline2?.copyWith(
                            color: headingColor,
                          ),
                    ),
                    Visibility(
                      visible: headingIcon != null,
                      child: InfoTipButton(
                        message: subHeading,
                        icon: headingIcon,
                        iconColor: isErrorCard
                            ? appTheme(context).colorScheme.onSecondary
                            : appTheme(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              TextButtonTheme(
                data: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: isErrorCard
                        ? appTheme(context).colorScheme.onSecondary
                        : appTheme(context).colorScheme.secondary,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buttons,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
