import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.ffShamelBold18.copyWith(
            color: AppColors.black,
          ),
        ),
        GestureDetector(
          onTap: onViewAll,
          child: Text(
            'الكل',
            style: AppTextStyle.ffShamelBold16.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
