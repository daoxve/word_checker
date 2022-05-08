import 'package:word_checker/core/exports/exports.dart';

import 'privacy_policy_viewmodel.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrivacyPolicyViewModel>.reactive(
      viewModelBuilder: () => PrivacyPolicyViewModel(),
      builder: (context, model, child) => const Scaffold(
        appBar: CustomAppbar(
          title: 'Privacy Policy',
        ),
      ),
    );
  }
}
