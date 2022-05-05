import 'package:animations/animations.dart';
import 'package:word_checker/core/exports/exports.dart';

import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => Scaffold(
        body: PageTransitionSwitcher(
          reverse: model.reverse,
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation, secondaryAnimation) => FadeThroughTransition(
            child: child,
            animation: animation,
            fillColor: appTheme(context).backgroundColor,
            secondaryAnimation: secondaryAnimation,
          ),
          child: model.getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: appTheme(context).backgroundColor,
          selectedItemColor: Colors.blue,
          unselectedItemColor: appTheme(context).iconTheme.color?.withOpacity(0.5),
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
