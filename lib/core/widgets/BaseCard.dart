import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/CustomCard_Category.dart';

class MenCard extends BaseCard {
  const MenCard({
    super.key,
    required super.title,
    required super.imageUrl,
    required String badgeText,
  }) : super(
          titleColor: const Color(0xFF091A43),
        );
}

class WomenCard extends BaseCard {
  const WomenCard({
    super.key,
    required super.title,
    required super.imageUrl,
    required String badgeText,
  }) : super(
          titleColor: const Color(0xFFE69EA3),
        );
}

class KidsCard extends BaseCard {
  const KidsCard({
    super.key,
    required super.title,
    required super.imageUrl,
    required String badgeText,
  }) : super(
          titleColor: const Color(0xff5877B7), // لون خاص بالأطفال
        );
}
