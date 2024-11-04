import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/core/widgets/Custom_Text_Feild.dart';
import 'package:flutter_project/core/widgets/SaudiPhone_Number_Form_Field.dart';
import 'package:flutter_project/core/widgets/custom_Buttom_Small.dart';

class SettingAccountPageView extends StatelessWidget {
  const SettingAccountPageView({super.key});
  static const routeName = 'SettingAccountPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: BuildAppBar(
        context,
        Title: ' تعديل البيانات ',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(AppConstants.logoPath)),
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              hintText: 'اسم المستخدم',
              textInputType: TextInputType.name,
              suffixIcon: Icon(Icons.person_outline),
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 20),
            const SaudiPhoneNumberFormField(),
            const SizedBox(height: 20),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            const SizedBox(height: 20),
            Center(
                child: customButtonSmall(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'تحديث البيانات')),
          ],
        ),
      ),
    );
  }
}
