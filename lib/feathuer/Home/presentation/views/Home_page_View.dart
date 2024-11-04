import 'package:flutter/material.dart';

import 'package:flutter_project/core/widgets/Custom_AppBar_home.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/HomePage_View_Body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});
  static const routeName = 'HomePageView';
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBarHomepage(context, Title: 'الرئيسية'),
      body: const SafeArea(child: HomePageViewBody()),
    );
  }
}
