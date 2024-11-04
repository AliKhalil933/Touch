import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/services/Shared_preferances_singleton.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/login_View.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.subTitle,
    required this.IsVisible,
    required this.imagePath,
  });

  final String imagePath;

  final Text subTitle;

  final bool IsVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                top: 220,
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              Visibility(
                visible: IsVisible,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setbool(KIsOnBordingViewSeen, true);
                      Navigator.of(context)
                          .pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text(
                      'تخط',
                      style: AppTextStyle.ffShamelBold13
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            textAlign: TextAlign.center,
            subTitle.data!.toString(),
            style: AppTextStyle.ffShamelRegular20
                .copyWith(color: const Color(0xff4E5556)),
          ),
        )
      ],
    );
  }
}
