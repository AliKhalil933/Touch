import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class OrderSuccessShipped extends StatelessWidget {
  const OrderSuccessShipped({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
              Text('#123456',
                  style: AppTextStyle.almaraiRegular16
                      .copyWith(color: AppColors.primaryColor)),
              const Spacer(),
              const Text(
                '2023-10-21 11:59 ص',
              )
            ],
          ),
          const Spacer(), // استخدام Spacer للمسافة بين النصوص
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('مي احمد  ', // الرسالة
                  style: AppTextStyle.ffShamelBold14.copyWith(
                    color: AppColors.primaryColor,
                  )),
              const Text(
                ' 400 ريال', // عرض التاريخ
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
