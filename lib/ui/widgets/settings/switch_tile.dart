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
    return Row(
      children: [
        Visibility(
          visible: icon != null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon ?? Icons.abc,
              color: Colors.blue,
            ),
          ),
        ),
        Text(
          label,
          style: labelStyle ?? appTextTheme(context).bodyText2,
        ),
        const Spacer(),
        Switch(
          value: switchValue,
          onChanged: onSwitchChanged,
        ),
      ],
    );
  }
}
