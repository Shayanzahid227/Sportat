import 'package:code_structure/core/others/base_view_model.dart';

class CustomerSupportViewModel extends BaseViewModel {
  int selectedTabIndex = 0;
  void setSelectedTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  ///
  ///      sub tabs in history section
  ///
  int selectedSubTabIndex = 0;
  void setSelectedSubTab(int index) {
    selectedSubTabIndex = index;
    notifyListeners();
  }

  ///
  ///      issues
  ///
  final allIssues = [
    {
      'subject': 'Login Issue',
      'status': 'Open',
      'date': '03 Jan 2020',
      'id': '6'
    },
    {
      'subject': 'Payment Problem',
      'status': 'Closed',
      'date': '02 Jan 2020',
      'id': '5'
    },
    {
      'subject': 'Account Verification',
      'status': 'Open',
      'date': '01 Jan 2020',
      'id': '4'
    },
    {
      'subject': 'SignUp Issue',
      'status': 'Open',
      'date': '03 Jan 2020',
      'id': '6'
    },
    {
      'subject': 'Booking Issue',
      'status': 'Closed',
      'date': '02 Jan 2020',
      'id': '5'
    },
    {
      'subject': 'Subscription Issue',
      'status': 'Open',
      'date': '01 Jan 2020',
      'id': '4'
    },
  ];
}
