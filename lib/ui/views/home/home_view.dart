import 'package:word_checker/exports.dart';
import 'package:word_checker/ui/widgets/main/bottom_card.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: appTheme(context).backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(54),
            child: AppBar(
              backgroundColor: appTheme(context).backgroundColor,
              title: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text('Word Checker'),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Visibility(
                    visible: model.wordCount != 0,
                    child: TextButton(
                      onPressed: () => model.undo(),
                      child: const Text('Clear'),
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),
                ),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(
                  thickness: 1.3,
                  height: 1,
                ),
              ),
              elevation: 0,
              centerTitle: true,
            ),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 16.0),
                child: TextField(
                  key: const PageStorageKey('storage-key'),
                  controller: model.textEdController,
                  maxLines: 35,
                  scrollPhysics: const BouncingScrollPhysics().applyTo(
                    const AlwaysScrollableScrollPhysics(),
                  ),
                  decoration: InputDecoration(
                    hintText: kHintText,
                    hintStyle: TextStyle(
                      color: appTheme(context).iconTheme.color!.withOpacity(0.3),
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: appTheme(context).iconTheme.color,
                    fontSize: 16,
                  ),
                  onChanged: model.onTextFieldChange,
                ),
              ),
              Positioned(
                bottom: 10,
                child: SizedBox(
                  width: 320,
                  height: 100,
                  child: BottomCard(
                    wordCount: model.wordCount.toString(),
                    characterCount: model.textEdController.text.length.toString(),
                    sentences: model.sentenceCount.toString(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
