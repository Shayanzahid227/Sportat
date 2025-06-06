import 'dart:math';
import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/auth/success_screen/success_screen_view_model.dart';
import 'package:code_structure/ui/home/home_screen.dart';
import 'package:code_structure/ui/root_screen/root_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_wallet/wallet_screen.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AmountAddedToWalletScreen extends StatefulWidget {
  const AmountAddedToWalletScreen({super.key});

  @override
  State<AmountAddedToWalletScreen> createState() =>
      _AmountAddedToWalletScreenState();
}

class _AmountAddedToWalletScreenState extends State<AmountAddedToWalletScreen> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController = ConfettiController(
      duration: const Duration(seconds: 30), // Longer duration
    );
    // Start the confetti as soon as screen loads
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SuccessScreenViewModel(),
      child: Consumer<SuccessScreenViewModel>(
        builder: (context, model, child) => Stack(
          // Changed to Stack
          children: [
            Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets().bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 130.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                            border: Border.all(), shape: BoxShape.circle),
                        child: Image.asset(
                          AppAssets().successIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                      30.verticalSpace,
                      _centerText(),
                      30.verticalSpace,
                      _getStartButton()
                    ],
                  ),
                ),
              ),
            ),
            // Add Confetti on top
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                blastDirectionality: BlastDirectionality.explosive,
                confettiController: confettiController,
                blastDirection: pi / 2, // Straight down
                maxBlastForce: 5,
                minBlastForce: 2,
                emissionFrequency: 0.05,
                numberOfParticles: 20,
                gravity: 0.1,
                shouldLoop: true, // Make it continuous
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// center text
  _centerText() {
    return Column(
      children: [
        Text(
          "Amount added successfully to your wallet",
          style:
              style16N.copyWith(fontWeight: FontWeight.w500, color: whiteColor),
        ),
        10.verticalSpace,
      ],
    );
  }

// get start button
  _getStartButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 85),
      child: CustomButton(
        text: 'Back to Wallet',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WalletScreen(),
            ),
          );
        },
      ),
    );
  }
}
