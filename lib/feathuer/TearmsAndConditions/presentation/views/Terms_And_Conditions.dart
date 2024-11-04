import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/TearmsAndConditions/presentation/views/Address_Privet_Order.dart';

class TermsAndCondistionsPageView extends StatefulWidget {
  static const routeName = 'TermsAndCondistionsPage';

  const TermsAndCondistionsPageView({super.key});
  @override
  _TermsAndCondistionsPageViewState createState() =>
      _TermsAndCondistionsPageViewState();
}

class _TermsAndCondistionsPageViewState
    extends State<TermsAndCondistionsPageView> {
  bool _isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'طلب خاص'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الشروط والأحكام',
                style: AppTextStyle.ffShamelBold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Text(
                'يجب أن لا تكشف عن رقم التعريف الشخصي الخاص بك إلى أي شخص بما في ذلك الأصدقاء أو أفراد العائلة أو أي تاجر. يجب ألا تكتب رقم التعريف الشخصي الخاص بك في أي مكان. يجب عدم استخدام رقم التعريف الشخصي إذا كان شخص آخر يمكن أن يراك وأنت تُدخله. يجب أن تلتزم بالإجراءات الأمنية التي نخبرك بها من وقت لآخر.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'الموافقة على الشروط والأحكام',
                    style: AppTextStyle.ffShamelSemiBold13
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isAgreed
                  ? () {
                      Navigator.pushNamed(
                          context, AddressPagePrivetOrder.routeName);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(200, 50),
              ),
              child: Text(
                'التالي',
                style:
                    AppTextStyle.ffShamelBold16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}