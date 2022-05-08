import 'package:word_checker/core/exports/exports.dart';

class Notch extends StatelessWidget {
  const Notch({
    Key? key,
    this.width,
    this.height,
    this.notchPadding,
    this.color = Colors.grey,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? notchPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: notchPadding ?? const EdgeInsets.only(top: 16),
      child: Align(
        child: SizedBox(
          height: height ?? 8,
          width: width ?? 48,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
