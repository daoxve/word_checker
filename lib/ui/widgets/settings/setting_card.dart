import 'package:word_checker/exports.dart';
import 'package:collection/collection.dart';

typedef ButtonsBuilder<T> = Map<String, T?> Function();

/// A card with a dynamically adjusting number of buttons
class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    this.heading,
    required this.buttonsBuilder,
    required this.iconsBuilder,
  }) : super(key: key);

  /// Title of this [SettingCard].
  /// Can optionally be null
  final String? heading;

  /// Defines a button to function map
  final ButtonsBuilder buttonsBuilder;

  /// Number of icons provided in the list must be equal to the number of items in [buttonsBuilder]
  final List<IconData> iconsBuilder;

  @override
  Widget build(BuildContext context) {
    final buttonOptions = buttonsBuilder();

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
                children: buttonOptions.keys.mapIndexed(
                  (i, optionTitle) {
                    final val = buttonOptions[optionTitle];
                    return TextButton.icon(
                      onPressed: val,
                      icon: Icon(iconsBuilder[i]),
                      label: Text(
                        optionTitle,
                        style: appTextTheme(context).bodyText2,
                      ),
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
