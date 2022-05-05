import 'package:word_checker/core/exports/exports.dart';

class ThemeDetailCard extends StatelessWidget {
  const ThemeDetailCard({
    Key? key,
    required this.innerContainerColor,
    required this.themeName,
    required this.themeDesc,
    required this.radioValue,
    required this.groupValue,
    required this.onRadioChanged,
  }) : super(key: key);

  final Color innerContainerColor;
  final String themeName;
  final String themeDesc;
  final int? radioValue;
  final int? groupValue;
  final void Function(int?) onRadioChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: appTheme(context).colorScheme.secondary,
              ),
              child: Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appTheme(context).backgroundColor,
                    width: 10,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: innerContainerColor,
                ),
              ),
            ),
          ),
          Text(
            themeName,
            style: appTextTheme(context).headline2,
          ),
          const SizedBox(height: 4),
          Text(
            themeDesc,
            style: appTextTheme(context).bodyText2,
          ),
          Radio<int?>(
            value: radioValue,
            groupValue: groupValue,
            activeColor: appTheme(context).colorScheme.secondary,
            onChanged: onRadioChanged,
          ),
        ],
      ),
    );
  }
}