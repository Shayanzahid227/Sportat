import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/customer_support/customer_support_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IssueSubjectScreen extends StatefulWidget {
  const IssueSubjectScreen({super.key});

  @override
  State<IssueSubjectScreen> createState() => _IssueSubjectScreenState();
}

class _IssueSubjectScreenState extends State<IssueSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerSupportViewModel(),
      child: Consumer<CustomerSupportViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: CustomAppBar(isBackButton: true, title: 'Issue Subject'),
          ),
        ),
      ),
    );
  }
}
