import 'package:code_structure/core/others/base_view_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';

class OtpViewModel extends BaseViewModel {
  TextEditingController otpController = TextEditingController();
  String otpText = "-  -  -  -  -  -";
  String otpCode = '';
  void updateOtp(String value) {
    otpCode = value;
    notifyListeners();
  }

  int _secondsRemaining = 20;
  Timer? _timer;
  bool _canResend = false;

  int get secondsRemaining => _secondsRemaining;
  bool get canResend => _canResend;

  OtpViewModel() {
    startTimer(); // Timer start as soon as ViewModel is initialized
  }

  void startTimer() {
    _canResend = false; // Disable resend initially
    _secondsRemaining = 20;
    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
      } else {
        _canResend = true; // Enable resend when timer finishes
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void resendCode() {
    if (!_canResend) return; // Prevent resending if timer is active

    startTimer(); // Restart timer
    // TODO: Implement API call to resend OTP
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
