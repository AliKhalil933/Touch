import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 206,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              text,
              style: AppTextStyle.ffShamelRegular18
                  .copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
