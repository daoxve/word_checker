import 'package:word_checker/exports.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    Key? key,
    this.icon,
    required this.label,
    this.labelStyle,
    required this.switchValue,
    this.onSwitchChanged,
  }) : super(key: key);

  final IconData? icon;
  final String label;
  final TextStyle? labelStyle;
  final bool switchValue;
  final void Function(bool)? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: switchValue,
      activeColor: appTheme(context).colorScheme.secondary,
      onChanged: onSwitchChanged,
      contentPadding: EdgeInsets.zero,
      secondary: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          icon ?? Icons.abc,
          color: appTheme(context).colorScheme.secondary,
        ),
      ),
      title: Text(
        label,
        style: labelStyle ?? appTextTheme(context).bodyText2,
      ),
    );
  }
}
