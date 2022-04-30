import 'package:word_checker/exports.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
    this.wordCount,
    this.characterCount,
    this.sentences,
  }) : super(key: key);

  final String? wordCount;
  final String? characterCount;
  final String? sentences;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kcGrey,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Word Count',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap.smallH,
                Text(
                 wordCount == '0' ? '-' : wordCount ?? '-',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Character Count',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Gap.smallH,
                Text(
                  characterCount == '0' ? '-' : characterCount ?? '-',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sentences',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Gap.smallH,
                Text(
                  sentences == '0' ? '-' : sentences ?? '-',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
