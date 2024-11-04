import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/feathuer/onBording/presentation/views/widgets/page_Veiw_item.dart';

class OnbordingPageView extends StatelessWidget {
  const OnbordingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  final PageController pageController;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: const [
        PageViewItem(
          IsVisible: true,
          imagePath: AppConstants.logoPath,
          subTitle: Text(
            AppConstants.appSubTitle1,
          ),
        ),
        PageViewItem(
          IsVisible: false,
          imagePath: AppConstants.logoPath,
          subTitle: Text(
            AppConstants.appSubTitle2,
          ),
        ),
      ],
    );
  }
}
