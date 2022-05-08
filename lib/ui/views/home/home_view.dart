import 'package:word_checker/core/exports/exports.dart';
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
          appBar: CustomAppbar(
            title: 'Word Checker',
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Visibility(
                  visible: model.isUndoing == false,
                  replacement: TextButton(
                    onPressed: model.undo,
                    child: Text('Undo (${model.undoTimeLeft})'),
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                      shape: const StadiumBorder(),
                    ),
                  ),
                  child: Visibility(
                    visible: model.wordCount != 0,
                    child: TextButton(
                      onPressed: model.clearAndStartTimer,
                      child: const Text('Clear'),
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 16.0),
                child: TextField(
                  key: const PageStorageKey('storage-key'),
                  controller: model.textEdController,
                  maxLines: 104,
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
