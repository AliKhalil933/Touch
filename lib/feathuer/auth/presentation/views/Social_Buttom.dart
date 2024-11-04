import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffE1E3E3), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(image),
          title: Text(
            textAlign: TextAlign.center,
            title,
            style:
                AppTextStyle.ffShamelRegular11.copyWith(color: AppColors.black),
          ),
        ),
      ),
    );
  }
}
