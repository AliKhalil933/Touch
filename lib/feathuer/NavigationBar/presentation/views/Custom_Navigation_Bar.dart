import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/NavigationBar/presentation/views/Custom_Navigation_Bar_body.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});
  static const String routeName = 'CustomNavigationBar';
  @override
  Widget build(BuildContext context) {
    return const CustomNavigationBarBody();
  }
}
