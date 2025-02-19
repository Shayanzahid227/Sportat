import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/others/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  String? selectedGender;
  String? selectedCountry;
  String? selectedCity;

  void setSelectedGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void setCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }

  void setCity(String city) {
    selectedCity = city;
    notifyListeners();
  }

  void setSelectedCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }

  void setSelectedCity(String city) {
    selectedCity = city;
    notifyListeners();
  }

  final List<String> countries = [
    'Egypt',
    'Kuwait',
    'Saudi Arabia',
    'United Arab Emirates',
    'Iraq',
  ];

  final List<String> cities = [
    'Cairo ',
    'Alexandria',
    'Giza',
    'Mansoura',
    'Aswan',
    'Luxor',
    'Kuwait',
    'Saudi Arabia',
    'United Arab Emirates',
    'Iraq',
  ];

  // ... rest of your existing code ...
}

// final _auth = FirebaseAuth.instance;

  // Future<void> register() async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //   } catch (e) {
  //     print("SignIn failed: $e");
  //   }
  // }

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // final _fromKey = GlobalKey<FormState>();
  // final RegExp _emailRegex = RegExp(
  //   r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  // );