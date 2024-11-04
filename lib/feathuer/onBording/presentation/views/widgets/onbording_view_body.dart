import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/services/Shared_preferances_singleton.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/login_View.dart';
import 'package:flutter_project/feathuer/onBording/presentation/views/widgets/onBording_page_view.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    pageController.addListener(() {
      if (pageController.page == 1.0) {
        Prefs.setbool(KIsOnBordingViewSeen, true);
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SafeArea(
            child: OnbordingPageView(
              pageController: pageController,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryColor.withOpacity(0.5),
            activeColor: AppColors.primaryColor,
            size: const Size(10, 10),
            activeSize: const Size(20, 10),
          ),
        ),
        const SizedBox(height: 29),
        const SizedBox(height: 43),
      ],
    );
  }
}
