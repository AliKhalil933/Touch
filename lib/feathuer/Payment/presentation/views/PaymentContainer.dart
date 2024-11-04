import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/Payment_page_view_Body.dart';

class PaymentContainer extends StatelessWidget {
  final String title;
  final List<String> images;
  final Widget icon;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const PaymentContainer({
    super.key,
    required this.title,
    required this.images,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 58,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 3,
          ),
        ],
        border: Border.all(
          color: const Color(0xff3e1b44f0),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PaymentMethodOption(
            title: title,
            images: images,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withOpacity(0.6),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                  spreadRadius: 3,
                ),
                BoxShadow(
                  color: AppColors.white.withOpacity(0.6),
                  blurRadius: 6,
                  offset: const Offset(0, -3),
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Center(child: icon),
          ),
        ],
      ),
    );
  }
}
