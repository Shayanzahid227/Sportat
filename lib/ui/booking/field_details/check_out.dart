import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_back_button.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/root_screen/root_view_model.dart';
import 'package:code_structure/ui/booking/field_details/confirmed_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(0),
      child: Consumer<RootViewModel>(builder: (context, model, child) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(
                  title: "Check Out",
                  isBackButton: true,
                )),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    _firstSection(),
                    20.verticalSpace,
                    _secondSection(),
                    20.verticalSpace,
                    CustomButton(
                        text: 'Pay',
                        onPressed: () {
                          Get.to(
                            ConfirmedBookingScreen(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 500),
                          );
                        }),
                    100.verticalSpace
                  ],
                ),
              ),
            ));
      }),
    );
  }

  _firstSection() {
    return Container(
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text('booking summery',
                style: style25B.copyWith(
                  color: darkGreyColor,
                )),
            30.verticalSpace,
            _pricingDetail('Players Gender', 'male'),
            20.verticalSpace,
            _pricingDetail('Location', 'AL-Malaz'),
            20.verticalSpace,
            _pricingDetail('Field', 'Field 1 (11X11)'),
            20.verticalSpace,
            _pricingDetail('Date', '12th March 2024'),
            20.verticalSpace,
            _pricingDetail(
              'Time',
              '08:00 AM to 10:00 AM',
            ),
            20.verticalSpace,
            Divider(
              color: lightGreyColor3,
              thickness: 1,
            ),
            _pricingDetail('SubTotal', '100 SAR'),
            20.verticalSpace,
            _pricingDetail('Earned Points', '100 Points',
                color: secondaryColor),
            Divider(
              color: lightGreyColor3,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total price',
                  style: style18B.copyWith(
                    color: blackColor,
                  ),
                ),
                Text(
                  '325 SAR',
                  style: style25B.copyWith(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  ///
  ///     first section row of price and title
  ///
  Row _pricingDetail(String title, String price, {Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style16.copyWith(
            color: lightGreyColor,
          ),
        ),
        Text(
          price,
          style: style16B.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }

  ///
  ///      second section of payment method
  ///
  // Add this at the class level to store available methods and selected one
  List<Map<String, String>> paymentMethods = [
    {'type': 'wallet', 'title': 'Wallet', 'icon': AppAssets().walletIcon},
    {
      'type': 'visa',
      'title': 'Visa end ****5156',
      'icon': AppAssets().viseCardIcon
    },
    {'type': 'mada', 'title': 'Mada', 'icon': AppAssets().madaCardIcon},
  ];

  String selectedMethod = 'wallet';

  _secondSection() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 0.2),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment method',
                    style: style25.copyWith(color: darkGreyColor)),
                15.verticalSpace,
                ...paymentMethods.map((method) {
                  return _paymentMethodTile(
                    method['type']!,
                    method['title']!,
                    method['icon']!,
                    selectedMethod,
                    () {
                      setState(() {
                        selectedMethod = method['type']!;
                      });
                    },
                  );
                }).toList(),
                10.verticalSpace,
                GestureDetector(
                  onTap: () {
                    _showAddCardBottomSheet(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryColor,
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_card_sharp,
                          color: primaryColor,
                        ),
                        10.horizontalSpace,
                        10.horizontalSpace,
                        Text(
                          'Add New Card',
                          style: style16B.copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _paymentMethodTile(String type, String title, String iconAssetName,
      String selectedType, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedType == type ? primaryColor : borderColor,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selectedType == type
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: selectedType == type ? primaryColor : borderColor,
            ),
            10.horizontalSpace,
            Image.asset(
              iconAssetName,
              width: 30.w,
              height: 30.h,
              fit: BoxFit.contain,
            ),
            10.horizontalSpace,
            Text(
              title,
              style: style16B.copyWith(color: darkGreyColor),
            )
          ],
        ),
      ),
    );
  }

  ///
  ///      show model bottom sheet
  ///
  void _showAddCardBottomSheet(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expiryDateController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();
    bool saveCard = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: whitecolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(''),
                      Text('Add New Card',
                          style: style25B.copyWith(color: darkGreyColor)),
                      GestureDetector(
                          onTap: () {
                            navigator?.pop(context);
                          },
                          child: Icon(Icons.cancel_outlined))
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name on the card',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: expiryDateController,
                          decoration: InputDecoration(
                            labelText: 'Expiry Date',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: cvvController,
                          decoration: InputDecoration(
                            labelText: 'CVV',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Checkbox(
                        value: saveCard,
                        onChanged: (value) {
                          setState(() {
                            saveCard = value!;
                          });
                        },
                        activeColor: primaryColor,
                      ),
                      Text('Save In My Cards',
                          style: style16.copyWith(color: darkGreyColor)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Add Card',
                    onPressed: () {
                      if (nameController.text.isEmpty ||
                          cardNumberController.text.isEmpty ||
                          expiryDateController.text.isEmpty ||
                          cvvController.text.isEmpty) {
                        showTopSnackBar(context, 'Please fill all fields');
                        return; // Don't pop if any field is empty
                      }

                      // Optionally return new card data
                      // final newCard = {
                      //   'type': 'card',
                      //   'title': 'Card ****${cardNumberController.text.substring(cardNumberController.text.length - 4)}',
                      //   'icon': AppAssets().viseCardIcon,
                      // };

                      Navigator.pop(
                          context); // Only pops if all fields are filled
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  ///
  ///      snake bar
  ///
  void showTopSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove after 2 seconds
    Future.delayed(const Duration(seconds: 2))
        .then((_) => overlayEntry.remove());
  }

  ///
  ///
  ///      lsat bracket
}
