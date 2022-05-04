import 'package:word_checker/exports.dart';

class InfoTipButton extends StatelessWidget {
  const InfoTipButton({
    Key? key,
    required this.message,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final String? message;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message ?? '',
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      decoration: ShapeDecoration(
        color: appTheme(context).colorScheme.onSecondary.withOpacity(0.6),
        shape: const _TooltipShapeBorder(radius: 6, arrowArc: 0.2),
      ),
      height: 45,
      textStyle: appTextTheme(context).headline2?.copyWith(
            fontSize: 12,
            color: appTheme(context).iconTheme.color!.computeLuminance() > 0.5
                ? appTheme(context).iconTheme.color
                : Colors.white,
          ),
      child: IconTheme(
        data: IconThemeData(
          color: iconColor,
          size: 21,
        ),
        child: Icon(icon),
      ),
    );
  }
}

class _TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  const _TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomRight.dx + x / 180, rect.bottomRight.dy - 3)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(-x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
