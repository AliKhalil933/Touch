import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/SigunUp_View.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'لا تمتلك حساب؟ ',
          style: AppTextStyle.ffShamelRegular16
              .copyWith(color: const Color(0xff707070))),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(context, SignUpView.routeName);
            },
          text: 'سجل الآن',
          style: AppTextStyle.ffShamelRegular16
              .copyWith(color: AppColors.lightprimaryColor))
    ]));
  }
}
