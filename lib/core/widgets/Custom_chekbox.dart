import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';

class CustomChekbox extends StatelessWidget {
  const CustomChekbox(
      {super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: isChecked ? Colors.transparent : Colors.grey,
                  width: 1.5)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: isChecked
              ? const Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 18,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
