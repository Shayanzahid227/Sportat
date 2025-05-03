import 'package:code_structure/core/constants/colors.dart';
import 'package:flutter/material.dart';

enum NotificationType {
  bookingConfirmation,
  pointsEarned,
  productPurchase,
  returnConfirmation,
  eventReminder,
  discount,
  socialInteraction,
  purchaseUpdate,
  pointsUpdate
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
    this.cardColor = whiteColor,
    this.borderColor = secondaryColor,
  });
}

class TextSegment {
  final String text;

  TextSegment(
    this.text,
  );
}
