import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';

import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String routeName = 'PrivacyPolicy';
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'سياسة الخصوصية'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppConstants.logoPath,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                ' يجب انا يتعهد المستخدم بأن جميع ما يتم الحصول عليه ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
