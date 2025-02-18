import 'package:code_structure/core/others/base_view_model.dart';

import 'dart:async';

class OtpViewModel extends BaseViewModel {
  String otpCode = '';
  int timerSeconds = 20;
  Timer? _timer;
  bool canResend = false;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        timerSeconds--;
        notifyListeners();
      } else {
        canResend = true;
        _timer?.cancel();
        notifyListeners();
      }
    });
  }

  void updateOtp(String value) {
    otpCode = value;
    notifyListeners();
  }

  void resendOtp() {
    if (canResend) {
      timerSeconds = 20;
      canResend = false;
      startTimer();
      // Add your OTP resend logic here
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
