import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.onPtrssed, required this.text});
  final VoidCallback onPtrssed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0))),
        onPressed: onPtrssed,
        child: Text(
          text,
          style:
              AppTextStyle.ffShamelRegular20.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
