import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class ProductCardForProduct extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  const ProductCardForProduct({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: 197,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12, // زيادة تأثير الظل
            offset: const Offset(0, 6), // إزاحة الظل للأسفل
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            Card(
              elevation: 4, // زيادة الإرتفاع لإضافة عمق أكبر
              shadowColor: Colors.black.withOpacity(0.2), // لون ظل الكارد
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // قسم للصورة
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top:
                              Radius.circular(12.0)), // إضافة تدوير أعلى للصورة
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // صف لاسم المنتج والسعر مع المساحة بينهما
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // اسم المنتج
                        Expanded(
                          child: Text(
                            productName,
                            style: AppTextStyle.ffShamelBold10,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // سعر المنتج
                        Text(
                          '$price ريال',
                          style: AppTextStyle.ffShamelRegular11.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 80,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    AppColors.primaryColor,
                    AppColors.tharedColor,
                  ]),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // لون الظل للكارت
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  'ملابس رجالي',
                  style: AppTextStyle.ffShamelRegular16
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
