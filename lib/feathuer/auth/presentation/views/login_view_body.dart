import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_Buttom.dart';
import 'package:flutter_project/core/widgets/Custom_Text_Feild.dart';
import 'package:flutter_project/core/widgets/SaudiPhone_Number_Form_Field.dart';
import 'package:flutter_project/feathuer/NavigationBar/presentation/views/Custom_Navigation_Bar.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/Dont_Have_AN_Account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: Stack(
          children: [
            Positioned(
              top: 92,
              left: 85,
              width: 204,
              height: 170,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppConstants.logoPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 180 + 92),
                Text(
                  'مرحبا بعودتك',
                  style: AppTextStyle.ffShamelBold23
                      .copyWith(color: AppColors.secondaryColor),
                ),
                const SizedBox(height: 40),
                const SaudiPhoneNumberFormField(),
                const SizedBox(height: 16),
                const CustomTextFormField(
                  hintText: ' كلمة المرور',
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppTextStyle.ffShamelRegular16
                          .copyWith(color: AppColors.lightprimaryColor),
                    ),
                  ),
                ]),
                const SizedBox(height: 33),
                CustomButtom(onPtrssed: () {}, text: 'تسجيل الدخول'),
                const SizedBox(
                  height: 27,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CustomNavigationBar.routeName);
                  },
                  child: Text(
                    'متابعة كزائر',
                    style: AppTextStyle.ffShamelRegular18
                        .copyWith(color: AppColors.black),
                  ),
                ),
                const SizedBox(height: 16),
                DontHaveAnAccountWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
