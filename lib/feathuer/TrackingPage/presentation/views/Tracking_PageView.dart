import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/TrackingPage/presentation/views/Tracking_PageView_Body.dart';

class TrackingPageView extends StatelessWidget {
  const TrackingPageView({super.key});
  static const String routeName = 'TrackingPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'تتبع الطلب'),
      body: SafeArea(child: TrackingPageViewBody()),
    );
  }
}
