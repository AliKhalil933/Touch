import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';

import 'package:flutter_project/feathuer/auth/presentation/views/SigunUp_View_Body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SigunUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'انشاء حساب'),
      body: const SafeArea(child: SignUpViewBody()),
    );
  }
}
