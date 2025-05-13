import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/auth_text_feild.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/customer_support/customer_support_view_model.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/customer_support/issue_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerSupportViewModel(),
      child: Consumer<CustomerSupportViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: CustomAppBar(isBackButton: true, title: 'Customer Support'),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                20.verticalSpace,
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      2,
                      (index) {
                        final tabTitles = [
                          'Support',
                          'History',
                        ];
                        return _tabs(
                          text: tabTitles[index],
                          isSelected: model.selectedTabIndex == index,
                          onTap: () {
                            model.setSelectedTab(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
                20.verticalSpace,
                model.selectedTabIndex == 0
                    ? supportTab()
                    : model.selectedTabIndex == 1
                        ? historyTab(model)
                        : supportTab()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///       support tab
  ///
  supportTab() {
    String? selectedIssueType; // To store the selected dropdown value
    List<String> issueTypes = [
      'Technical Issue',
      'Billing Problem',
      'Account Help',
      'General Inquiry'
    ];
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: selectedIssueType,
          decoration: authSignUpFieldDecoration.copyWith(
            hintText: selectedIssueType ?? 'Issue type',
            hintStyle: style12.copyWith(color: lightGreyColor),
            suffixIcon:
                Icon(Icons.keyboard_arrow_down), // Your custom suffix icon
          ),
          items: issueTypes.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: style12),
            );
          }).toList(),
          onChanged: (newValue) {
            selectedIssueType = newValue;
          },
          icon: const SizedBox.shrink(), // This hides the default icon
        ),
        20.verticalSpace,
        TextFormField(
          maxLines: 3,
          decoration: authSignUpFieldDecoration.copyWith(
              hintText: 'How shall we help you ?',
              hintStyle: style12.copyWith(color: lightGreyColor)),
        ),
        20.verticalSpace,
        CustomButton(
          text: 'Submit',
          onPressed: () {},
        )
      ],
    );
  }

  ///
  ///       History tab
  ///
  ///
  ///       History tab
  ///
  historyTab(CustomerSupportViewModel model) {
    final filteredIssues = model.selectedSubTabIndex == 0
        ? model.allIssues
        : model.selectedSubTabIndex == 1
            ? model.allIssues
                .where((issue) => issue['status'] == 'Open')
                .toList()
            : model.allIssues
                .where((issue) => issue['status'] == 'Closed')
                .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              3,
              (index) {
                final tabTitles = ['All', 'Open', 'Closed'];
                return _subHistorytabs(
                  text: tabTitles[index],
                  isSelected: model.selectedSubTabIndex == index,
                  onTap: () {
                    model.setSelectedSubTab(index);
                  },
                );
              },
            ),
          ),
        ),
        20.verticalSpace,
        if (filteredIssues.isEmpty)
          Center(
            child: Text(
              'No Issues found ',
              style: style14.copyWith(color: darkGreyColor),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filteredIssues.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final issue = filteredIssues[index];
              return GestureDetector(
                onTap: () {
                  Get.to(IssueSubjectScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            issue['subject']!,
                            style: style14.copyWith(
                                fontWeight: FontWeight.bold, color: blackColor),
                          ),
                          Container(
                            width: 80.w,
                            height: 25,
                            decoration: BoxDecoration(
                              color: issue['status'] == 'Open'
                                  ? primaryColor.withOpacity(0.3)
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                                child: Text(
                              issue['status']!,
                              style: style12.copyWith(),
                            )),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            issue['id']!,
                            style: style14.copyWith(color: blackColor),
                          ),
                          5.horizontalSpace,
                          Image.asset(
                            AppAssets().helpIcon,
                            scale: 4,
                          ),
                          Spacer(),
                          Text(
                            issue['date']!,
                            style: style12.copyWith(color: darkGreyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
  // historyTab(CustomerSupportViewModel model) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       10.verticalSpace,
  //       Align(
  //         alignment: Alignment.topLeft,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: List.generate(
  //             3,
  //             (index) {
  //               final tabTitles = ['All', 'Opened', 'Closed'];
  //               return _subHistorytabs(
  //                 text: tabTitles[index],
  //                 isSelected: model.selectedSubTabIndex == index,
  //                 onTap: () {
  //                   model.setSelectedSubTab(index);
  //                 },
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       20.verticalSpace,
  //       model.selectedSubTabIndex == 0
  //           ? Text('all')
  //           : model.selectedSubTabIndex == 1
  //               ? Text('opened')
  //               : model.selectedSubTabIndex == 2
  //                   ? Text('closed')
  //                   : Text('no data found')
  //     ],
  //   );
  // }

  ///
  ///      tab
  ///
  _tabs(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: 110.w,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isSelected ? secondaryColor : blackColor,
          ),
        ),
        child: Text(
          text,
          style: style14.copyWith(color: isSelected ? whiteColor : blackColor),
        ),
      ),
    );
  }

  ///
  ///     sub tab in history section
  ///
  _subHistorytabs(
      {required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: 84.w,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1, color: isSelected ? primaryColor : darkGreyColor),
        ),
        child: Text(
          text,
          style: style14.copyWith(
              color: isSelected ? primaryColor : darkGreyColor),
        ),
      ),
    );
  }
}
