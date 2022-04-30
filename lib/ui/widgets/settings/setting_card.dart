import 'package:word_checker/exports.dart';

/// A card with a dynamically adjusting number of buttons
class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    this.heading,
    required this.buttons,
  }) : super(key: key);

  /// Title of this [SettingCard].
  /// Can optionally be null
  final String? heading;

  /// Body of this [SettingCard]
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
            children: [
              Visibility(
                visible: heading != null,
                child: Text(
                  heading ?? 'Heading',
                  style: appTextTheme(context).headline2,
                ),
              ),
              const SizedBox(height: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buttons,
              )
            ],
          ),
        ),
      ),
    );
  }
}
