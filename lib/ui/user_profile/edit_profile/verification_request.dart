import 'dart:io';
import 'package:code_structure/core/constants/app_assest.dart';
import 'package:code_structure/core/constants/colors.dart';
import 'package:code_structure/core/constants/text_style.dart';
import 'package:code_structure/custom_widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class VerificationRequestScreen extends StatefulWidget {
  const VerificationRequestScreen({super.key});

  @override
  State<VerificationRequestScreen> createState() =>
      _VerificationRequestScreenState();
}

class _VerificationRequestScreenState extends State<VerificationRequestScreen> {
  File? frontFile;
  File? backFile;

  Future<void> _pickImage(bool isFront) async {
    try {
      PermissionStatus status;

      // Request appropriate permission based on platform
      if (Platform.isAndroid) {
        status = await Permission.storage.request();
      } else if (Platform.isIOS) {
        status = await Permission.photos.request();
      } else {
        status = PermissionStatus.denied;
      }

      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission denied')),
        );
        return;
      }

      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 90,
      );

      if (picked != null) {
        setState(() {
          if (isFront) {
            frontFile = File(picked.path);
          } else {
            backFile = File(picked.path);
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _removeFile(bool isFront) {
    setState(() {
      if (isFront) {
        frontFile = null;
      } else {
        backFile = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(
          isBackButton: true,
          title: "Verification Request",
        ),
      ),
      body: SingleChildScrollView(child: _uploadSection()),
    );
  }

  ///
  ///      upload section
  ///
  Widget _uploadSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _singleUploadItem(
            title: 'Proof of Identity (Front)',
            file: frontFile,
            onUpload: () => _pickImage(true),
            onRemove: () => _removeFile(true),
          ),
          const SizedBox(height: 20),
          _singleUploadItem(
            title: 'Proof of Identity (Back)',
            file: backFile,
            onUpload: () => _pickImage(false),
            onRemove: () => _removeFile(false),
          ),
        ],
      ),
    );
  }

  ///
  ///       Upload item
  ///
  Widget _singleUploadItem({
    required String title,
    required File? file,
    required VoidCallback onUpload,
    required VoidCallback onRemove,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: style16.copyWith(fontSize: 16)),
            const Spacer(),
            GestureDetector(
              // Wrap with GestureDetector
              onTap: onUpload, // Add this line
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets().noteIcon,
                        scale: 4,
                      ),
                      5.horizontalSpace,
                      Text(
                        'UPLOAD',
                        style: style12.copyWith(color: whiteColor),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        if (file != null)
          Stack(
            children: [
              Container(
                height: 80,
                width: 100,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: lightGreyColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Image.file(file,
                      width: 40, height: 40, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
