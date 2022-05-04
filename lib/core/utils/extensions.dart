import 'dart:ui';

extension ExtendedList<E> on List<E> {
  void forEachIndexed(void Function(int index, E element) action) {
    for (var index = 0; index < length; index++) {
      action(index, this[index]);
    }
  }
}

extension HexToColor on String {
  Color hexToColor() {
    return Color(
      int.parse(toLowerCase().substring(1, 7), radix: 16) + 0xFF000000,
    );
  }
}
