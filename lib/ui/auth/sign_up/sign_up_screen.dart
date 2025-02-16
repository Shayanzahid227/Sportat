import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [Text('sign up screen')],
      )),
    );
  }
}
