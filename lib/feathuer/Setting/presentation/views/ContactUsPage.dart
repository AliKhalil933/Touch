import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/widgets/custom_Buttom_Small.dart';

class ContactUsPage extends StatelessWidget {
  static const String routeName = 'contactus';

  const ContactUsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'تواصل معنا'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppConstants.logoPath,
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),

            // عنوان الصفحة
            const Center(
              child: Text(
                'تواصل معنا عبر',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // أيقونة الهاتف
            const Center(
              child: Icon(
                Icons.phone,
                size: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),

            // نص إضافي
            const Center(
              child: Text(
                'أو أرسل رسالة لإدارة التطبيق',
                style: AppTextStyle.ffShamelBold16,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // عنوان الرسالة
            const Text(
              'عنوان الرسالة',
              style: AppTextStyle.ffShamelBold16,
            ),
            const SizedBox(height: 10),

            _buildCircularTextField('  '),
            const SizedBox(height: 20),

            const Text(
              'محتوى الرسالة',
              style: AppTextStyle.ffShamelBold16,
            ),
            const SizedBox(height: 10),

            _buildCircularTextField('  '),
            const SizedBox(height: 30),
            Center(
              child: customButtonSmall(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'ارسال'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCircularTextField(String hintText) {
    return Stack(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 25,
          child: Divider(thickness: 2),
        ),
      ],
    );
  }
}
