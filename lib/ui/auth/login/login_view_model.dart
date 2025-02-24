import 'package:code_structure/core/others/base_view_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController phoneController = TextEditingController();

  String _selectedCountryCode = "+966"; // Default country code
  String _selectedFlag = "🇸🇦"; // Default flag as emoji

  String get selectedCountryCode => _selectedCountryCode;
  String get selectedFlag => _selectedFlag;

  void updateCountry(String code, String flag) {
    _selectedCountryCode = code;
    _selectedFlag = flag; // Store emoji flag instead of image path
    notifyListeners(); // Notifies the UI about the change
  }
}
