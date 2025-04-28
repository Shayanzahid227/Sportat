// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/core/model/notification.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomAppBar(title: "Notifications")),
      body: ListView(
        children: [
          ///
          /// Booking Confirmation
          ///
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    AppAssets().bookingConfirmationIcon,
                    scale: 3,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Confirmation",
                        style: style16B,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text:
                              'Your booking is confirmed! 🏅 Get ready for your football session At,',
                          style: style14,
                          children: [
                            TextSpan(
                              text: 'Prince Faisal bin Fahd Stadium',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: ', Riyadh on',
                              style: style14,
                            ),
                            TextSpan(
                              text: ' September 5th, 2024, at 7:00 PM. ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'See you on the field!',
                              style: style14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///
          /// Points Earned
          ///
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    AppAssets().pointsEarnIcon,
                    scale: 3,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Points Earned",
                        style: style16B,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: 'You’ve earned',
                          style: style14,
                          children: [
                            TextSpan(
                              text: ' 75',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '  points from your recent booking at ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'The Arena Sports Complex, Dammam ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'on ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'August 28th, 2024!',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  ' Keep booking and collect more points to unlock exclusive rewards!',
                              style: style14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///
          /// Product Purchase Confirmation
          ///
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    AppAssets().productPurchaseConfirmationIcon,
                    scale: 3,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Purchase Confirmation",
                        style: style16B,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Great news! 🎁 Your ',
                          style: style14,
                          children: [
                            TextSpan(
                              text: 'Under Armour Compression Shirt ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'from ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'Namshi, Dammam ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  'has arrived. Visit the store to pick it up or arrange for home delivery.',
                              style: style14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///
          /// Return Confirmation
          ///
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    AppAssets().returnConfirmationIcon,
                    scale: 3,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Return Confirmation",
                        style: style16B,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Your return request for ',
                          style: style14,
                          children: [
                            TextSpan(
                              text:
                                  'the Nike Air Zoom Pegasus 40 running shoes ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  'has been processed successfully. 🛍️ Please drop off the item ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'at Fitness Time Store, Riyadh   ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'by ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'September 12th, 2024 ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'for a full refund.',
                              style: style14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///
          /// Event Reminder
          ///
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    AppAssets().eventReminderIcon,
                    scale: 3,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event Reminder",
                        style: style16B,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Reminder: Your ',
                          style: style14,
                          children: [
                            TextSpan(
                              text: 'tennis match ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'is scheduled at ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'Al-Nakheel Club, Jeddah ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'on ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'October 10th, 2024, at 5:30 PM ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '.Get ready to serve!',
                              style: style14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///
          /// Discount for you
          ///
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor, width: 0.4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: SvgPicture.asset(
                      AppAssets().discount,
                      width: 30,
                      height: 30,
                    )),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discount for you 🏷️",
                        style: style16B,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Flash Sale! 🏷️ ',
                          style: style14,
                          children: [
                            TextSpan(
                              text: '15% ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'off on all bookings at ',
                              style: style14,
                            ),
                            TextSpan(
                              text: 'King Abdullah Sports City, Jeddah ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'for the next  ',
                              style: style14,
                            ),
                            TextSpan(
                              text: '48 ',
                              style: style14.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'hours. Book now for any day in September!',
                              style: style14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          _socialCard(
              icon: AppAssets().likeicon,
              title: 'Alex liked your post!',
              img: AppAssets().profileImage,
              ontap: () {}),
          _socialCard(
              icon: AppAssets().likeicon,
              title: 'John liked your reel!',
              img: AppAssets().profileImage,
              ontap: () {}),
          _socialCard(
              icon: AppAssets().repostIcon,
              title: 'Emily reposted your content!',
              img: AppAssets().profileImage,
              ontap: () {}),
          _socialCard(
              icon: AppAssets().followIcon,
              title: 'Michael started following you!',
              img: AppAssets().profileImage,
              ontap: () {}),

          _socialCard(
              icon: AppAssets().followIcon,
              title: 'Emma followed you back!',
              img: AppAssets().profileImage,
              ontap: () {}),

          _socialCard(
              icon: AppAssets().hashtag,
              title: 'David tagged you in a post!',
              img: AppAssets().profileImage,
              ontap: () {}),

          _cartNotification(
              imgUrl: AppAssets().productPurchaseConfirmationIcon,
              title:
                  'Your purchase was successful! Thank you for shopping with us.'),
          _cartNotification(
              imgUrl: AppAssets().productPurchaseConfirmationIcon,
              title:
                  'Your order has been placed! Check your purchases for details.'),
          _cartNotification(
              imgUrl: AppAssets().pointsEarnIcon,
              title:
                  'You earned 50 Energy points! Keep engaging to earn more.'),
          _cartNotification(
              imgUrl: AppAssets().pointsEarnIcon,
              title: 'You’ve gained 30 points! Check your points balance now.')
        ],
      ),
    );
  }
}

_socialCard(
    {required String title,
    required String img,
    required String icon,
    required VoidCallback? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 0.4, color: primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
                ),
              ),
              CircleAvatar(
                radius: 10.r,
                backgroundColor: whitecolor,
                child: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: secondaryColor.withOpacity(0.20),
                  child: Image.asset(
                    icon,
                    height: 10.h,
                    width: 10.w,
                    color: secondaryColor,
                  ),
                ),
              )
            ],
          ),
          20.horizontalSpace,
          Expanded(
            child: Text(
              title,
              style: style14B,
            ),
          )
        ],
      ),
    ),
  );
}

_cartNotification({required String title, required String imgUrl}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 0.4, color: primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Image.asset(
                imgUrl,
                scale: 3,
              )),
          20.horizontalSpace,
          Expanded(
            child: Text(
              title,
              style: style14,
            ),
          )
        ],
      ),
    ),
  );
}

enum SegmentType {
  normal,
  highlighted, // Primary color + medium weight
  boldHighlight, // Primary color + bold
  neutral, // Secondary color
  success, // Green color for positive messages
}

///
///
/// A class to represent a segment of text with different styles.
/// It has a text and a type.
/// The type is used to determine the style of the text.
///

///
/// Examples
///
class TextSegment {
  final String text;
  final SegmentType type;

  TextSegment(this.text, {this.type = SegmentType.normal});
}

class NotificationStyles {
  static TextStyle normal = style14;
  static TextStyle highlighted = style14.copyWith(
    color: primaryColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle boldHighlight = style14.copyWith(
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle neutral = style14.copyWith(
    color: Colors.grey,
  );
  static TextStyle success = style14.copyWith(
    color: Colors.green,
  );

  static TextStyle getStyle(SegmentType type) {
    switch (type) {
      case SegmentType.highlighted:
        return highlighted;
      case SegmentType.boldHighlight:
        return boldHighlight;
      case SegmentType.neutral:
        return neutral;
      case SegmentType.success:
        return success;
      default:
        return normal;
    }
  }
}

class NotificationModel {
  final NotificationType type;
  final String title;
  final List<TextSegment> messageSegments;
  final String iconPath;
  final Color cardColor;
  final Color borderColor;

  NotificationModel({
    required this.type,
    required this.title,
    required this.messageSegments,
    required this.iconPath,
    this.cardColor = Colors.white,
    this.borderColor = Colors.blue,
  });
}

// NotificationModel(
//   type: NotificationType.bookingConfirmation,
//   title: "Booking Confirmation",
//   messageSegments: [
//     TextSegment("Your booking is confirmed! 🏅 Get ready for your football session At, "),
//     TextSegment("Prince Faisal bin Fahd Stadium", type: SegmentType.highlighted),
//     TextSegment(", Riyadh on"),
//     TextSegment(" September 5th, 2024, at 7:00 PM.", type: SegmentType.boldHighlight),
//     TextSegment(" See you on the field!"),
//   ],
//   iconPath: AppAssets().bookingConfirmationIcon,
//   borderColor: primaryColor,
// ),

// RichText(
//   text: TextSpan(
//     children: notification.messageSegments.map((segment) {
//       return TextSpan(
//         text: segment.text,
//         style: NotificationStyles.getStyle(segment.type),
//       );
//     }).toList(),
//   ),
// ),
