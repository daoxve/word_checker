import 'package:flutter/cupertino.dart';
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
    return _CustomSwitchListTile(
      value: switchValue,
      activeColor: appTheme(context).colorScheme.secondary,
      onChanged: onSwitchChanged,
      contentPadding: EdgeInsets.zero,
      secondary: Padding(
        padding: const EdgeInsets.only(left: 8.0),
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

class _CustomSwitchListTile extends StatelessWidget {
  /// This has been shamelessly copied from Material/SwitchListTile.
  /// The applicable license applies.
  const _CustomSwitchListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.contentPadding,
    this.selected = false,
  })  : assert(!isThreeLine || subtitle != null),
        super(key: key);

  final bool value;

  final ValueChanged<bool>? onChanged;

  final Color? activeColor;

  final Widget? title;

  final Widget? subtitle;

  final Widget? secondary;

  final bool isThreeLine;

  final bool? dense;
  final EdgeInsetsGeometry? contentPadding;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final Widget control = Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? CupertinoColors.activeGreen,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    return MergeSemantics(
      child: ListTileTheme.merge(
        selectedColor: activeColor ?? CupertinoColors.activeGreen,
        child: ListTile(
          leading: secondary,
          title: title,
          subtitle: subtitle,
          trailing: control,
          isThreeLine: isThreeLine,
          contentPadding: contentPadding,
          horizontalTitleGap: 0,
          dense: dense,
          enabled: onChanged != null,
          onTap: onChanged != null
              ? () {
                  onChanged!(!value);
                }
              : null,
          selected: selected,
        ),
      ),
    );
  }
}
