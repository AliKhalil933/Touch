import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class SaudiPhoneNumberFormField extends StatelessWidget {
  const SaudiPhoneNumberFormField({super.key, this.suffixIcon});

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3),
            blurRadius: 6,
            spreadRadius: -3,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'رقم الجوال',
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '+966',
              style:
                  AppTextStyle.ffShamelRegular16.copyWith(color: Colors.grey),
            ),
          ),
          hintStyle:
              AppTextStyle.ffShamelRegular16.copyWith(color: Colors.grey),
          filled: true,
          fillColor: Colors.transparent,
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'من فضلك أدخل رقم الجوال';
          } else if (!RegExp(r'^5\d{8}$').hasMatch(value)) {
            return 'أدخل رقم جوال سعودي صحيح';
          }
          return null;
        },
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: .5),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    );
  }
}
