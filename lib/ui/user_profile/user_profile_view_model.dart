import 'package:code_structure/core/others/base_view_model.dart';

class UserProfileViewModel extends BaseViewModel {
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}
