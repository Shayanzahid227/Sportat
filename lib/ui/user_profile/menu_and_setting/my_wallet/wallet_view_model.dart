import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_structure/core/others/base_view_model.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_wallet/wallet_screen.dart';
import 'package:flutter/cupertino.dart';

class WalletViewModel extends BaseViewModel {
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  ///
  ///
  ///
  List<TransactionModel> TransactionList = [
    TransactionModel(
      title: 'Received Credit',
      subtitle: 'Transfer 1000 energy points',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: true,
    ),
    TransactionModel(
      title: 'Shop Payment',
      subtitle: 'T-shirt new coll',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: false,
    ),
    TransactionModel(
      title: 'Received Credit',
      subtitle: 'Transfer 1000 energy points',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: true,
    ),
    TransactionModel(
      title: 'Shop Payment',
      subtitle: 'T-shirt new coll',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: true,
    ),
    TransactionModel(
      title: 'Shop Payment',
      subtitle: 'T-shirt new coll',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: true,
    ),
    TransactionModel(
      title: 'Received Credit',
      subtitle: 'Transfer 1000 energy points',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: true,
    ),
    TransactionModel(
      title: 'Shop Payment',
      subtitle: 'T-shirt new coll',
      amount: 326.80,
      date: DateTime(2023, 11, 17),
      isCredit: false,
    ),
  ];
}
