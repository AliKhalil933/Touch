import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

ElevatedButton customButtonSmall(
    {required VoidCallback onPressed, required String title}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 16),
    ),
    child: Text(
      title,
      style: AppTextStyle.almaraiBold16.copyWith(color: Colors.white),
    ),
  );
}
