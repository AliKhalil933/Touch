import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon; // أيقونة الزر
  final VoidCallback onPressed; // الإجراء عند الضغط
  final Color backgroundColor; // لون الخلفية
  final double size; // حجم الأيقونة

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.size = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: size),
        onPressed: onPressed,
      ),
    );
  }
}
