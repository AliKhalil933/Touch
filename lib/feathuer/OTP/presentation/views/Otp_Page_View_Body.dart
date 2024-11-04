import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_project/constants.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';
import 'package:flutter_project/feathuer/NavigationBar/presentation/views/Custom_Navigation_Bar.dart';
import 'package:flutter_project/core/widgets/custom_Buttom_Small.dart';

class OtpPageViewBody extends StatefulWidget {
  const OtpPageViewBody({super.key});

  @override
  _OtpPageViewBodyState createState() => _OtpPageViewBodyState();
}

class _OtpPageViewBodyState extends State<OtpPageViewBody> {
  int _start = 60; // 60 seconds countdown
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 204,
                width: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'lib/assets/logo/logo_1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'تأكيد الحساب',
              style:
                  AppTextStyle.ffShamelBold16.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 12),
            Text(
              'برجاء ادخال الكود',
              style:
                  AppTextStyle.ffShamelRegular16.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'أدخل الكود',
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(height: 16),
            _start > 0
                ? Text(
                    'إعادة إرسال الكود بعد $_start ثانية',
                    style: const TextStyle(color: Colors.grey),
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        _start = 60;
                      });
                      startTimer();
                    },
                    child: const Text('إعادة إرسال الكود مرة أخرى'),
                  ),
            const SizedBox(height: 16),
            customButtonSmall(
                onPressed: () {
                  Navigator.pushNamed(context, CustomNavigationBar.routeName);
                },
                title: 'تأكيد'),
          ],
        ),
      ),
    );
  }
}
