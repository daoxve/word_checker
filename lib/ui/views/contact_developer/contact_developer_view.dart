import 'package:word_checker/core/exports/exports.dart';

import 'contact_developer_viewmodel.dart';

class ContactDeveloperView extends StatelessWidget {
 const ContactDeveloperView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ContactDeveloperViewModel>.reactive(
     viewModelBuilder: () => ContactDeveloperViewModel(),
     builder: (context, model, child) => const Scaffold(
       appBar: CustomAppbar(
          title: 'Contact developer',
        ),
     ),
   );
 }
}