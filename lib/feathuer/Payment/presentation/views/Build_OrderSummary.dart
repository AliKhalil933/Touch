import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/OrderSummaryRow.dart';

Widget buildOrderSummary() {
  return Container(
    padding: const EdgeInsets.all(10),
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
        Text(
          'ملخص الطلب',
          style: AppTextStyle.ffShamelBold16
              .copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 10),
        const OrderSummaryRow(label: 'إجمالي السلة:', value: '100.00 ريال'),
        const SizedBox(height: 5),
        const OrderSummaryRow(label: 'سعر الضريبة:', value: '15.00 ريال'),
        const SizedBox(height: 5),
        const OrderSummaryRow(label: 'رسوم الشحن:', value: '18.00 ريال'),
        const SizedBox(height: 5),
        const Divider(thickness: 1),
        const OrderSummaryRow(label: 'إجمالي التكلفة:', value: '133.00 ريال'),
      ],
    ),
  );
}
