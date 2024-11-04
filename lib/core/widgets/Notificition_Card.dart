import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10), // مسافة بين الكروت
      padding: const EdgeInsets.all(16.0), // مسافة داخل الكارت
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // حدود مستديرة
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: 398,
      height: 95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Touch',
                  style: AppTextStyle.almaraiRegular16.copyWith(
                      color: AppColors.secondaryColor.withOpacity(
                    0.9,
                  ))),
              const SizedBox(
                width: 15,
              ),
              const Text(
                '#123456',
              )
            ],
          ),
          const Spacer(), // استخدام Spacer للمسافة بين النصوص
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('سيتم توصيل طلبك خلال أسبوع', // الرسالة
                  style: AppTextStyle.ffShamelBold14.copyWith(
                    color: AppColors.black,
                  )),
              Text(
                ' ${DateTime.now().toLocal().toString().split(' ')[0]}', // عرض التاريخ
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
