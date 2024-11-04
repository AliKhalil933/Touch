import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class WomenProductCard extends StatelessWidget {
  const WomenProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  });

  final String imageUrl;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5), // تحريك الظل للأسفل
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم صورة المنتج مع تأثيرات
            SizedBox(
              height: 140,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // تأثير اللون عند التحميل
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // عرض اسم المنتج
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                productName,
                style: AppTextStyle.ffShamelBold16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 25),
            // عرض سعر المنتج مع كلمة "السعر"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'السعر: ',
                    style: AppTextStyle.ffShamelRegular11.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productPrice,
                    style: AppTextStyle.ffShamelRegular11.copyWith(
                      color: AppColors.primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
