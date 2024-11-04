import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'تمتلك حساب ؟ ',
          style:
              AppTextStyle.ffShamelRegular16.copyWith(color: AppColors.black)),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pop(context);
            },
          text: 'سجل دخول',
          style: AppTextStyle.ffShamelRegular16
              .copyWith(color: AppColors.lightprimaryColor))
    ]));
  }
}
