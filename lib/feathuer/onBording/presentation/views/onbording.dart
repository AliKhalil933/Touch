import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/onBording/presentation/views/widgets/onbording_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = 'Onbording';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBordingViewBody(),
    );
  }
}
