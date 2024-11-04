import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/OTP/presentation/views/Otp_Page_View_Body.dart';

class OtpPageView extends StatelessWidget {
  const OtpPageView({super.key});
  static const String routeName = 'OtpPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'تفعيل الحساب'),
      body: const SafeArea(child: OtpPageViewBody()),
    );
  }
}
