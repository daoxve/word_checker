import 'package:word_checker/core/exports/exports.dart';

class MainViewModel extends IndexTrackingViewModel {
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }
}
