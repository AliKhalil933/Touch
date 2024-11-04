import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/Notification/presentation/views/NotificationPageViewBody.dart';

class NotificitonPageView extends StatelessWidget {
  const NotificitonPageView({super.key});
  static const String routeName = 'NavigationPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: 'تنبيهاتي'),
      body: const SafeArea(child: NotificationPageViewBody()),
    );
  }
}
