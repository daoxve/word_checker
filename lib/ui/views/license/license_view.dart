import 'package:word_checker/core/exports/exports.dart';

import 'license_viewmodel.dart';

class LicenseView extends StatelessWidget {
 const LicenseView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<LicenseViewModel>.reactive(
     viewModelBuilder: () => LicenseViewModel(),
     builder: (context, model, child) => const Scaffold(
       appBar: CustomAppbar(
          title: 'License',
        ),
     ),
   );
 }
}