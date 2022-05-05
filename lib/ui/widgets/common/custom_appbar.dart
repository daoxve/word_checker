import 'package:word_checker/core/exports/exports.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.actions,
    required this.title,
    this.centerTitle = true,
    this.onNavigateBack,
  }) : super(key: key);

  final List<Widget>? actions;
  final String title;
  final bool centerTitle;
  final void Function()? onNavigateBack;

  @override
  Widget build(BuildContext context) {
    final _navigationService = locator<NavigationService>();
    final _canPop = ModalRoute.of(context)?.canPop ?? false;

    return AppBar(
      backgroundColor: appTheme(context).backgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(title),
      ),
      actions: actions,
      iconTheme: appTheme(context).iconTheme,
      leading: _canPop
          ? InkResponse(
              onTap: onNavigateBack ?? _navigationService.back,
              radius: 24,
              splashColor: appTheme(context).colorScheme.secondary.withOpacity(0.3),
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.keyboard_backspace),
              ),
            )
          : null,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          thickness: 1.3,
          height: 1,
        ),
      ),
      elevation: 0,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
