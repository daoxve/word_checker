import 'package:word_checker/core/exports/exports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.heading,
    required this.controller,
    this.validator,
    this.isHexCodeField = true,
    this.hexBoxWidth,
    this.maxLength,
    this.charCount,
    this.onChanged,
  }) : super(key: key);

  final String heading;
  final String? Function(String?)? validator;
  final bool isHexCodeField;
  final double? hexBoxWidth;
  final TextEditingController controller;
  final int? maxLength;
  final int? charCount;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width - 90;

    return Row(
      children: [
        Visibility(
          visible: isHexCodeField,
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              '#',
              style: appTextTheme(context).bodyText1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: LimitedBox(
            maxWidth: isHexCodeField ? (hexBoxWidth ?? 150) : fullWidth,
            maxHeight: isHexCodeField ? 50 : fullWidth,
            child: TextFormField(
              controller: controller,
              style: appTextTheme(context).bodyText1?.copyWith(fontSize: 16),
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxLength ?? 6),
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  ), // denies all emoji characters
                ),
                if (isHexCodeField) FilteringTextInputFormatter(RegExp('^[A-Za-z0-9_-]*'), allow: true),
              ],
              decoration: InputDecoration(
                hintText: heading,
                hintStyle: appTextTheme(context).bodyText1?.copyWith(
                      fontSize: 16,
                      color: appTheme(context).iconTheme.color?.withOpacity(0.5),
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme(context).iconTheme.color ?? Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: appTheme(context).colorScheme.secondary),
                ),
              ),
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ),
        Visibility(
          visible: isHexCodeField == false,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 36.0),
            child: Text(
              '${charCount ?? 0}/$maxLength',
              style: appTextTheme(context).bodyText1,
            ),
          ),
        ),
      ],
    );
  }
}
