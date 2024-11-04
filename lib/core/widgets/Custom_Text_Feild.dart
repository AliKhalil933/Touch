import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
  });

  final String hintText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // تعيين العرض كما هو مطلوب
      height: 63, // تعيين الارتفاع كما هو مطلوب
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16), // ظل خارجي
            offset: const Offset(0, 3), // تعيين إزاحة الظل
            blurRadius: 6, // مقدار التشويش للظل الخارجي
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.16), // ظل داخلي
            offset: const Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0), // نصف قطر الحواف
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle:
              AppTextStyle.ffShamelRegular16.copyWith(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildFocusedBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل قيمة';
              }
              return null;
            },
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return const OutlineInputBorder(
      borderSide:
          BorderSide(color: Colors.transparent, width: 0), // إخفاء الحدود
      borderRadius: BorderRadius.all(Radius.circular(10.0)), // نصف قطر الحواف
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: Colors.blue, width: 1.5), // حدود عند التركيز
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}
