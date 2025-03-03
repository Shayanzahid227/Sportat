// ignore_for_file: use_key_in_widget_constructors

import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      color: secondryColor.withOpacity(0.20),
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
                      color: secondryColor.withOpacity(0.20),
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
                      color: secondryColor.withOpacity(0.20),
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
          /// PReturn Confirmation
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
                      color: secondryColor.withOpacity(0.20),
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
          )
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: notifications.map((notification) {
      //       return notification['type'] == 'social'
      //           ? SocialNotificationCard(
      //               image: notification['image'],
      //               title: notification['title'],
      //             )
      //           : SystemNotificationCard(
      //               icon: notification['icon'],
      //               title: notification['title'],
      //               message: notification['message'],
      //               highlight: notification['highlight'] ?? '',
      //             );
      //     }).toList(),
      //   ),
      // ),
    );
  }
}

// class SystemNotificationCard extends StatelessWidget {
//   final String icon;
//   final String title;
//   final String message;
//   final String highlight;

//   const SystemNotificationCard({
//     required this.icon,
//     required this.title,
//     required this.message,
//     required this.highlight,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: secondryColor.withOpacity(0.20),
//                 borderRadius: BorderRadius.circular(10.r)),
//             child: Image.asset(
//               "$icon",
//               scale: 3,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 RichText(
//                   text: TextSpan(
//                     text: message,
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                     children: [
//                       TextSpan(
//                         text: highlight,
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.green.shade700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SocialNotificationCard extends StatelessWidget {
//   final String image;
//   final String title;

//   const SocialNotificationCard({
//     required this.image,
//     required this.title,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundImage: AssetImage(image),
//             radius: 24,
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
