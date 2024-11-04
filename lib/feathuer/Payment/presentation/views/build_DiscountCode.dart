import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

Widget buildDiscountCodeSection() {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'كود الخصم',
                  style: AppTextStyle.ffShamelBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'أدخل كود الخصم',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: 10,
        top: 50,
        child: ElevatedButton(
          onPressed: () {}, // Keeping it empty for now
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(140, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: const Text('تحقق', style: TextStyle(color: Colors.white)),
        ),
      ),
    ],
  );
}
