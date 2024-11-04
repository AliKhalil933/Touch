import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

class FaqPageview extends StatelessWidget {
  const FaqPageview({super.key});
  static const routeName = 'FaqPageview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: ' الاسئلة الشائعة'),
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
            ' ماهي فائدة التطبيق للمستخدمين؟',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ))
        ]),
      ),
    );
  }
}
