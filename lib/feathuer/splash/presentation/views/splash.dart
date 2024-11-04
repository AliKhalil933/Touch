import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/splash/presentation/views/widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
