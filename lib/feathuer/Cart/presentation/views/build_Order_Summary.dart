import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.29),
              offset: const Offset(0, 3),
              blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('ملخص الطلب',
                style: AppTextStyle.ffShamelBold14
                    .copyWith(color: AppColors.primaryColor)),
          ),
          _buildSummaryRow('عدد المنتجات:', '1'),
          const Divider(color: Colors.grey),
          _buildSummaryRow('سعر المنتجات:', '20.00 ريال'),
          const Divider(color: Colors.grey),
          _buildSummaryRow('سعر الضريبة:', '3.00 ريال'),
          const Divider(color: Colors.grey),
          _buildSummaryRow('رسوم الشحن:', '18 ريال'),
          const Divider(color: Colors.grey),
          _buildSummaryRow('إجمالي التكلفة:', '41.00 ريال'),
          const Divider(color: Colors.grey),
          _buildSummaryRow('حالة الطلب:', 'بإنتظار الدفع'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: AppTextStyle.ffShamelRegular14
                  .copyWith(color: AppColors.black)),
          Text(value,
              style: AppTextStyle.ffShamelRegular14
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
