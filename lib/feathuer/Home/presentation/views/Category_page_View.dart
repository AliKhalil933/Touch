import 'package:flutter/material.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Category_Page_ViewBody.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({super.key});
  static const routeName = 'CategoryPageView';

  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CategoryPageViewBody(),
      ),
    );
  }
}
