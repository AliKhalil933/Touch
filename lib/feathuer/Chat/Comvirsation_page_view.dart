import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Custom_AppBar.dart';
import 'package:flutter_project/feathuer/Chat/ComvirsationPageViewBody.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});
  static const String routeName = 'ComvirsationPageView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar(context, Title: 'تواصل معنا'),
        body: const SafeArea(child: ChatPageViewBody()));
  }
}
