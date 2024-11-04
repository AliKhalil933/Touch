import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Setting_page_view_body.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});
  static const String routeName = 'SettingPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, Title: ''),
      body: const SafeArea(child: SettingPageViewBody()),
    );
  }
}
