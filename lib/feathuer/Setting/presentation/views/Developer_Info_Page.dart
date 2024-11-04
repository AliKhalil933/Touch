import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/App_Colors.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/utils/app_images.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

class DeveloperInfoPage extends StatelessWidget {
  static const routeName = 'DeveloperInfoPage';
  const DeveloperInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'عن المطور'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Developer Logo
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  AppConstants.logoPath,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'لمسة',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'إصدار التطبيق : 1.0.0',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 5),
              const Text(
                'تصميم وبرمجة',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 5),
              const Text(
                'إتمام لتقنية نظم المعلومات',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              // WhatsApp Contact
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.assetsAssetsImagesWhatsapp,
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '920017221',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
