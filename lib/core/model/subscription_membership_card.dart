import 'dart:ui';

class MembershipCardModel {
  final String title;
  final double price;
  final Color? color;
  final int points;
  final String description;

  MembershipCardModel({
    required this.title,
    this.color,
    required this.price,
    required this.points,
    required this.description,
  });
}
