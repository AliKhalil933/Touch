import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}
