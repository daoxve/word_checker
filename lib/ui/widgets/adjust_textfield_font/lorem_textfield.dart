import 'package:word_checker/core/exports/exports.dart';

class LoremTextField extends HookWidget {
  const LoremTextField({
    Key? key,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
  }) : super(key: key);

  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    final textfieldController = useTextEditingController(text: loremIpsum65chars);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.smallH,
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Preview',
              style: appTextTheme(context).headline2,
            ),
          ),
          TextField(
            controller: textfieldController,
            maxLines: 10,
            readOnly: true,
            decoration: InputDecoration(
              hintText: kHintText,
              hintStyle: TextStyle(
                color: appTheme(context).iconTheme.color!.withOpacity(0.3),
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: appTheme(context).iconTheme.color,
              fontSize: fontSize ?? 16,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: lineHeight,
            ),
          ),
        ],
      ),
    );
  }
}