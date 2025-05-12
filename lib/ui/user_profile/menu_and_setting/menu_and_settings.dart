import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:code_structure/custom_widgets/buttons/custom_button.dart';
import 'package:code_structure/ui/setting/setting_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/help_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_bookings/my_booking_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_note/my_note.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_subscription/my_subscription.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/my_wallet/wallet_screen.dart';
import 'package:code_structure/ui/user_profile/my_orders/my_orders_screen.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/wish_list/my_wish_list.dart';
import 'package:code_structure/ui/user_profile/menu_and_setting/shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';

class MenuAndSettingsScreen extends StatelessWidget {
  const MenuAndSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomAppBar(
            title: "Menu And Settings",
            isBackButton: true,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [_topSection(), _secondSection(), _lastSection()],
          ),
        ),
      ),
    );
  }

  _socialButton(imagePath, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: blackColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }

  ///
  ///      top secction
  ///
  _topSection() {
    return Column(
      children: [
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectableCard(
              onTap: () {
                Get.to(MyBookingScreen());
              },
              imagePath: AppAssets().booking,
              text: 'My Booking',
              borderColor: secondaryColor,
              iconContainerColor: secondaryColor,
            ),
            SelectableCard(
              onTap: () {
                Get.to(MySubscriptionScreen());
              },
              imagePath: AppAssets().topSubscriptionIcon,
              text: 'My \nSubscription',
              borderColor: primaryColor,
              iconContainerColor: primaryColor,
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectableCard(
              onTap: () {
                Get.to(MyNoteScreen());
              },
              imagePath: AppAssets().noteIcon,
              text: 'My Notes',
              borderColor: secondaryColor,
              iconContainerColor: lightGreyColor,
            ),
            SelectableCard(
              onTap: () {
                Get.to(WalletScreen());
              },
              imagePath: AppAssets().walletIcon,
              text: 'My wallet',
              borderColor: secondaryColor,
              iconContainerColor: lightGreyColor,
            ),
          ],
        ),
      ],
    );
  }

  ///
  ///      second section
  ///
  _secondSection() {
    return Column(
      children: [
        30.verticalSpace,
        Container(
          decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: transparentColor),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              CustomListTile(
                leadingImagePath: AppAssets().boxIcon,
                title: 'My Orders',
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {
                  Get.to(MyOrdersScreen());
                  print('Tapped My Notes');
                },
              ),
              5.verticalSpace,
              CustomListTile(
                leadingImagePath: AppAssets().heartIcon,
                title: 'WishList',
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {
                  Get.to(MyWishListScreen());
                  print('Tapped My Notes');
                },
              ),
              5.verticalSpace,
              CustomListTile(
                leadingImagePath: AppAssets().locationIcon,
                title: 'Shipping Address',
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {
                  Get.to(ShippingAddressScreen());
                  print('Tapped My Notes');
                },
              ),
            ],
          ),
        ),
        20.verticalSpace,
        Container(
          decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: transparentColor),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              CustomListTile(
                leadingImagePath: AppAssets().settingIcon,
                title: 'Settings',
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {
                  Get.to(SettingScreen());
                  print('Tapped My Notes');
                },
              ),
              5.verticalSpace,
              CustomListTile(
                leadingImagePath: AppAssets().helpIcon,
                title: 'Help',
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {
                  Get.to(HelpScreen());
                  print('Tapped My Notes');
                },
              ),
            ],
          ),
        ),
        20.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpacingDiagonal,
                Text(
                  'Verification Request',
                  style: style12.copyWith(color: lightGreyColor),
                ),
                10.verticalSpace,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                        text: 'Submit Verification Request', onPressed: () {}),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        )
      ],
    );
  }

  ///
  ///      last section
  ///
  _lastSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        30.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _socialButton(AppAssets().f, () {}),
              _socialButton(AppAssets().i, () {}),
              _socialButton(AppAssets().t, () {}),
              _socialButton(AppAssets().x, () {}),
              _socialButton(AppAssets().w, () {}),
              _socialButton(AppAssets().l, () {})
            ],
          ),
        )
      ],
    );
  }
}

///
///
///
class SelectableCard extends StatefulWidget {
  final String imagePath;
  final String text;
  final Color borderColor;
  final Color iconContainerColor;
  final VoidCallback onTap;

  const SelectableCard(
      {Key? key,
      required this.imagePath,
      required this.text,
      required this.borderColor,
      required this.iconContainerColor,
      required this.onTap})
      : super(key: key);

  @override
  State<SelectableCard> createState() => _SelectableCardState();
}

class _SelectableCardState extends State<SelectableCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // () => setState(() => isSelected = !isSelected),
      onTap: widget.onTap,
      child: Container(
        width: 185.w,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: widget.borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : widget.iconContainerColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(
                  widget.imagePath,
                  color: isSelected ? Colors.black : Colors.white,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
///     list tile
///

class CustomListTile extends StatelessWidget {
  final String leadingImagePath;
  final String title;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.leadingImagePath,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              leadingImagePath,
              scale: 3,
            ),
            const SizedBox(width: 16),
            Expanded(
              child:
                  Text(title, style: style14.copyWith(color: lightGreyColor)),
            ),
            Icon(
              trailingIcon,
              size: 20,
              color: lightGreyColor3,
            ),
          ],
        ),
      ),
    );
  }
}
