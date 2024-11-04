import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

class AboutUsViewPage extends StatelessWidget {
  const AboutUsViewPage({super.key});
  static const routeName = 'AboutUsViewPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'من نحن'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: KHorizontalPadding,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.asset(
              AppConstants.logoPath,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 40),

          // عنوان الصفحة
          const Center(
              child: Text(
            'لمسة تطبيق صمم بشغف وحب من قبل فريق سعودي',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
            ),
          ))
        ]),
      ),
    );
  }
}
