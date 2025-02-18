// // import 'package:flutter/material.dart';

// import 'package:code_structure/core/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class CustomloginButton extends StatefulWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final value;
//   final bool loading;

//   const CustomloginButton(
//       {required this.text,
//       required this.onPressed,
//       this.value,
//       this.loading = false});

//   @override
//   State<CustomloginButton> createState() => _CustomloginButtonState();
// }

// class _CustomloginButtonState extends State<CustomloginButton> {
//   bool isSelected = true;

//   @override
//   void initState() {
//     super.initState();
//   }

// // for button color
//   void onClick() {
//     setState(() {
//       isSelected = !isSelected;
//     });
//   }

//   // for navigation
//   void toggleSelection() {
//     setState(() {
//       isSelected = !isSelected;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: () {
//         toggleSelection(); // Change button state
//         widget.onPressed(); // Trigger the onPressed callback
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(21),
//           ),
//           //  border: Border.all(color: PrimaryLoginButtonColor),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment:
//               MainAxisAlignment.center, // Center content vertically
//           children: [
//             Container(
//               height: screenHeight * 0.07,
//               width: screenWidth * 0.45,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2,
//                   color: PrimaryLoginButtonColor,
//                 ),

//                 ///
//                 ///
//                 ///   when button color is changing then navigation does't perform
//                 ///
//                 ///
//                 ///
//                 color: PrimaryLoginButtonColor,
//                 // color: isSelected ? Color(0xfff2d201c) : SecondarybuttonColor,

//                 ///
//                 ///
//                 ///
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               child: Center(
//                 child: widget.loading
//                     ? CircularProgressIndicator(
//                         strokeWidth: 3,
//                         color: filledColor,
//                       )
//                     : Text(
//                         widget.text,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 17,
//                             // color: isSelected ? Colors.white : Colors.black,
//                             color: filledColor),
//                       ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

import 'package:code_structure/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomloginButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final value;
  final bool loading;

  const CustomloginButton(
      {required this.text,
      required this.onPressed,
      this.value,
      this.loading = false});

  @override
  State<CustomloginButton> createState() => _CustomloginButtonState();
}

class _CustomloginButtonState extends State<CustomloginButton> {
  bool isSelected = true;

  @override
  void initState() {
    super.initState();
  }

// for button color
  void onClick() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  // for navigation
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        toggleSelection(); // Change button state
        widget.onPressed(); // Trigger the onPressed callback
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(21),
          ),
          //  border: Border.all(color: PrimaryLoginButtonColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 55.h,
                width: screenWidth * 1,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: PrimaryColor,
                  ),

                  ///
                  ///
                  ///   when button color is changing then navigation does't perform
                  ///
                  ///
                  ///
                  // color: PrimarybuttonColor,
                  color: isSelected ? PrimaryColor : Colors.white,

                  ///
                  ///
                  ///
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: widget.loading
                      ? CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.teal,
                        )
                      : Text(
                          widget.text,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: isSelected ? Colors.white : Colors.black,
                            // color: Color(0xffffffff)
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
