import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/App_Constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

import 'package:flutter_project/core/widgets/Custom_Buttom.dart';
import 'package:flutter_project/core/widgets/Custom_Text_Feild.dart';
import 'package:flutter_project/core/widgets/SaudiPhone_Number_Form_Field.dart';
import 'package:flutter_project/feathuer/OTP/presentation/views/Otp_view.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/Have_An_Account.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 204,
                        width: 170,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppConstants.Klogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // إضافة حقول النصوص المختلفة
                _buildLabel('اسم المستخدم'),
                const SizedBox(height: 8),
                const CustomTextFormField(
                  hintText: 'اسم المستخدم',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                _buildLabel('رقم الجوال'),
                const SizedBox(height: 8),
                const SaudiPhoneNumberFormField(),
                const SizedBox(height: 16),
                _buildLabel('البريد الالكترونى'),
                const SizedBox(height: 8),
                const CustomTextFormField(
                  hintText: 'Ali@gmail.com',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildLabel('كلمة السر'),
                const SizedBox(height: 8),
                const CustomTextFormField(
                  hintText: 'كلمة السر',
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16),
                _buildLabel('تأكيد كلمة السر'),
                const SizedBox(height: 8),
                const CustomTextFormField(
                  hintText: 'تأكيد كلمة السر',
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16),
                _buildLabel('مكان المستخدم'),
                const SizedBox(height: 8),
                const CustomTextFormField(
                  hintText: 'مكان المستخدم',
                  suffixIcon: Icon(Icons.location_on),
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomButtom(
                    onPtrssed: () {
                      Navigator.pushNamed(context, OtpPageView.routeName);
                    },
                    text: 'تسجيل الدخول'),
                const SizedBox(height: 16),
                Center(child: HaveAnAccountWidget()),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: AppTextStyle.ffShamelBold16.copyWith(color: AppColors.black),
      ),
    );
  }
}
